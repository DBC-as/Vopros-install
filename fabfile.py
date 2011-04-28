"""
Deployment fabfile for Vopros.
"""
from fabric.api import abort, cd, env, local, require, run, settings

# Config, paths, etc.
GIT_REPO = '/usr/local/git/repositories/drupal/profiles/vopros.git'
DRUSH_PATH = '/srv/bin/drush-latest/drush.php'
PROFILE_NAME = 'vopros'
PROFILES_PATH = '/srv/www/drupal7/profiles'
SITE_PATH = '/srv/www/drupal7/sites/vopros.revealit.dk'

env.roledefs = {
    'staging': ['stg001.revealit.dk'],
    'production': ['basil.revealit.dk:52202'],
}
env.user = 'fabric'


def update(commit_id):
    """
    Update the install profile without creating a new copy.

    Usage: "fab -R staging update:113693f" where 113693f is the Git commit id.

    Beware that this action can be dangerous to run on a new site, but it is a
    lot faster than building a new install profile from scratch.
    Be aware that this will only update the profile working copy, not the
    drush make file.
    """
    commit_id = commit_id.strip()
    if (len(commit_id) < 7 or len(commit_id) > 40):
        abort('Please specify a commit id between 7 or 40 characters.')

    try:
        float.fromhex(commit_id)
    except ValueError:
        abort('Commit ID must be a hexadecimal number (0-9a-f).')

    require('roles', 'hosts', used_for="configuring what servers to deploy to.")

    with cd('{path}/{profile}'.format(path=PROFILES_PATH, profile=PROFILE_NAME)):
        run('git fetch')
        run('git checkout {commit}'.format(commit=commit_id))

    post_deploy()

def deploy(commit_id):
    """
    Deploy a specific Git version to the server.

    Usage: "fab -R staging deploy:113693f" where 113693f is the Git commit id.

    This command will make a new checkout of the profile repository, build
    the profile via its make file, replace the previous deployed version
    with the new build, and finally run the post deploy actions, upgrading
    the database, etc.
    """
    commit_id = commit_id.strip()
    if (len(commit_id) < 7 or len(commit_id) > 40):
        abort('Please specify a commit id between 7 or 40 characters.')

    try:
        float.fromhex(commit_id)
    except ValueError:
        abort('Commit ID must be a hexadecimal number (0-9a-f).')

    require('roles', 'hosts', used_for="configuring what servers to deploy to.")

    with cd(PROFILES_PATH):
        # Start with getting rid of the previous copies if present.
        with settings(warn_only=True):
            run('rm -r {profile}.new'.format(profile=PROFILE_NAME))

        # Get a fresh checkout.
        run('git clone {repo} {profile}.new'.format(repo=GIT_REPO, profile=PROFILE_NAME))

        # Checkout the desired commit ID and run the make file.
        with cd('{profile}.new'.format(profile=PROFILE_NAME)):
            run('git checkout {commit}'.format(commit=commit_id))
            run('{drush} -y make --no-core --contrib-destination=. {profile}.make'.format(drush=DRUSH_PATH, profile=PROFILE_NAME))

        # Move the current version of the code to .old.
        with settings(warn_only=True):
            run('rm -r {profile}.old'.format(profile=PROFILE_NAME))
            run('mv {profile} {profile}.old'.format(profile=PROFILE_NAME))

        # Put the new copy into production.
        run('mv {profile}.new {profile}'.format(profile=PROFILE_NAME))

    post_deploy()


def post_deploy():
    """
    Run post-deploy operations.

    This includes running database migrations, reverting features, emptying
    the cache and running cron to make sure your Drupal site is coherent.
    """
    with cd(SITE_PATH):
        # Run database migrations.
        run('{drush} -y updb'.format(drush=DRUSH_PATH))

        # Revert all features (careful with this one).
        run('{drush} -y features-revert-all'.format(drush=DRUSH_PATH))

        # Clear the cache.
        run('{drush} -y cc all'.format(drush=DRUSH_PATH))

        # Run cron for good measure.
        run('{drush} -y cron'.format(drush=DRUSH_PATH))


def rollback():
    """
    Roll back to the previous version.
    """
    with cd(PROFILES_PATH):
        # Move the current production version away.
        run('rm -r {profile}.rollback'.format(profile=PROFILE_NAME))
        run('mv {profile} {profile}.rollback'.format(profile=PROFILE_NAME))

        # Move the old version of the code to current.
        run('mv {profile}.old {profile}'.format(profile=PROFILE_NAME))

    post_deploy()


