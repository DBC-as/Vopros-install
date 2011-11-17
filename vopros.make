api = 2
core = 7.x

; Contrib modules.
projects[apachesolr][subdir] = contrib
projects[apachesolr][version] = 1.0-beta8

projects[ctools][subdir] = contrib
projects[ctools][version] = 1.0-rc1

projects[diff][subdir] = contrib
projects[diff][download][type] = git
projects[diff][download][url] = http://git.drupal.org/project/diff.git
projects[diff][download][revision] = 2b6ab3841bb5f23f5c7d5848034442414e5992db

projects[entity][subdir] = contrib
projects[entity][version] = 1.0-rc1

projects[features][subdir] = contrib
projects[features][version] = 1.0-beta4

projects[feeds][subdir] = contrib
projects[feeds][version] = 2.0-alpha4

projects[fivestar][subdir] = contrib
projects[fivestar][version] = 2.0-alpha1

projects[job_scheduler][subdir] = contrib
projects[job_scheduler][version] = 2.0-alpha2

projects[libraries][subdir] = contrib
projects[libraries][version] = 1.0

projects[link][subdir] = contrib
projects[link][version] = 1.0

projects[mailhandler][subdir] = contrib
projects[mailhandler][download][type] = git
projects[mailhandler][download][url] = http://git.drupal.org/sandbox/googletorp/1173376.git
projects[mailhandler][download][revision] = bddc3b9e3b41bcb4b22e1cafa5eee2e522517eab

projects[nanosoap][subdir] = contrib
projects[nanosoap][download][type] = git
projects[nanosoap][download][url] = http://git.drupal.org/project/nanosoap.git
projects[nanosoap][download][revision] = 5f7e56dbbaca4c894dc69a96c0b23fb83c2a85b7

projects[profile2][subdir] = contrib
projects[profile2][version] = 1.1

projects[search_api][subdir] = contrib
projects[search_api][version] = 1.0-rc1

projects[search_api_solr][subdir] = contrib
projects[search_api_solr][version] = 1.0-rc1

projects[token][subdir] = contrib
projects[token][version] = 1.0-beta7

projects[uuid][subdir] = contrib
projects[uuid][version] = 1.x-dev

projects[views][subdir] = contrib
projects[views][version] = 3.0-rc1

projects[votingapi][subdir] = contrib
projects[votingapi][version] = 2.4

; Ting module

projects[osa_addi][subdir] = contrib
projects[osa_addi][type] = module
projects[osa_addi][download][type] = git
projects[osa_addi][download][url] = https://github.com/DBC-as/Vopros-opensearch-admin.git

projects[ting][type] = "module"
projects[ting][download][type] = "git"
projects[ting][download][url] = "git@github.com:ding2/ting.git"
projects[ting][download][tag] = "7.x-0.11"

; Our own module collection
projects[vopros][type] = module
projects[vopros][download][type] = git
projects[vopros][download][url] = git@github.com:DBC-as/Vopros-base.git

; Libraries
libraries[search_api_solr_php_client][download][type] = get
libraries[search_api_solr_php_client][download][url] = http://solr-php-client.googlecode.com/files/SolrPhpClient.r22.2009-11-09.zip
libraries[search_api_solr_php_client][directory_name] = SolrPhpClient
libraries[search_api_solr_php_client][destination] = libraries
