"""
Deployment fabfile for Vopros.
"""
from __future__ import with_statement
from fabric.api import abort, cd, env, local, require, run, settings

env.roledefs = {
    'staging': ['stg001.revealit.dk'],
    'production': ['basil.revealit.dk:52202'],
}
env.user = 'fabric'

def deploy(commit_id):
    """
    Deploy a specific Git version to the server.

    Usage: "fab -R staging deploy:113693f" where 113693f is the Git commit id.
    """
    commit_id = commit_id.strip()
    if (len(commit_id) < 7 or len(commit_id) > 40):
        abort('Please specify a commit id between 7 or 40 characters.')

    try:
        float.fromhex(commit_id)
    except ValueError:
        abort('Commit ID must be a hexadecimal number (0-9a-f).')

    require('roles', 'hosts', used_for="configuring what servers to deploy to.")

    with cd('/srv/www/drupal6/profiles'):
        # Start with getting rid of the previous copies if present.
        with settings(warn_only=True):
            run('rm -r vopros.new')

        # Get a fresh checkout.
        run('git clone /usr/local/git/repositories/drupal/profiles/vopros.git vopros.new')

        # Checkout the desired commit ID and run the make file.
        with cd('vopros.new'):
            run('git checkout %s' % commit_id)
            run('/srv/bin/drush-latest/drush.php -y make --no-core --contrib-destination=. vopros.make')

        # Move the current version of the code to .old.
        run('mv -f vopros vopros.old')

        # Put the new copy into production.
        run('mv vopros.new vopros')

    with cd('/srv/www/drupal6/sites/vopros.revealit.dk'):
        # Run database migrations.
        run('/srv/bin/drush-latest/drush.php -y updb')

        # Clear the cache.
        run('/srv/bin/drush-latest/drush.php -y cc all')

        # Run cron for good measure.
        run('/srv/bin/drush-latest/drush.php -y cron')

def rollback():
    """
    Roll back to the previous version.
    """
    with cd('/srv/www/drupal6/profiles'):
        # Move the current production version away.
        run('mv -f vopros vopros.rollback')

        # Move the old version of the code to current.
        run('mv vopros.old vopros')

