Vopros
======

A simple [Drupal][] distribution for question and answer sites in a library
context. Created in cooperation with [DBC][] and [Biblioteksvagten][]

Building
--------

You will need [drush make][] to build this install profile.

To build an install profile without Drupal core, run:

    drush make --no-core --contrib-destination=. vopros.make

If you want a developer version with Git working copies, run this
command instead:

    drush make --no-core --contrib-destination=. --working-copy vopros.make

Installing
----------

Once the site has been built with the needed modules an installation can
be done. The procedure is like installing any Drupal site, with one
detail: You will need to use the Vopros install profile. A quick recap
of the steps needed to perform the installation.

1. Go to example.com/install.php
2. Select Vopros install profile.
3. Follow the directions given in the installer.

Choosing the Vopros install profile will allow you to setup parts of the
Vopros functionality right away, instead of having to do it later. This
is not required, but some settings might be required to make everything
work as expected. (SMS and Migration in particular).

Features
--------

Along with the core question and answer handling the provides entities
for questions, answers, log messages, emails and SMSes, along with a
workflow designed for getting questions and answering them in an
efficient way. The Vorpos module pack that is required also offers some
additional and optional features.

* Rating
  
  It is possible to allow users to rate the answers that are given
  then. To implement this feature you will need to insert an iframe to
  a page, with a specific url of vopros/feedback/[email id]/[hash].
  Where the email id is the id of the email sent with the answer to be
  rated, while the hash is an MD5 created by adding the email id and a
  configurable secret. It is up to each site using this module pack to
  create a link the user can use, be it on a frontend site, or the
  actual Vopros site itself.

* Migration
  
  Vopros support migrating data from another question and answer
  system into Vopros. Right now only MSSQL is supported with a very
  specific data structure.

* Publish
  
  By default questions and answers are not public available. You can
  however with the public question module publish questions to make
  them public available. Right now published questions are created in
  the [data well][], a DBC powered project for storing data.

* Search
  
  Vopros comes with a module for setting up a search on questions and
  answers. Right now this requires a lot of custom setup, as both an
  apache solr server is needed to host the actual search along with an
  index created through the Search API Drupal module. To take full
  advantedge of the integration, the search index created needs to be
  called "answer and question".

[Drupal]: http://drupal.org/
[drush make]: http://drupal.org/project/drush_make
[DBC]: http://dbc.dk
[Biblioteksvagten]: http://biblioteksvagten.dk
[data well]: http://www.dbc.dk/produkter/alfabetisk-oversigt-over-alle-produkter/databrond


