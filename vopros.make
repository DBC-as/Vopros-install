api = 2
core = 7.x

; Contrib modules.
projects[ctools][subdir] = contrib
projects[ctools][version] = 1.0

projects[diff][subdir] = contrib
projects[diff][download][type] = git
projects[diff][download][url] = http://git.drupal.org/project/diff.git
projects[diff][download][revision] = 2b6ab3841bb5f23f5c7d5848034442414e5992db

projects[entity][subdir] = contrib
projects[entity][version] = 1.0

projects[facetapi][subdir] = contrib
projects[facetapi][version] = 1.2

projects[features][subdir] = contrib
projects[features][version] = 1.0

projects[feeds][subdir] = contrib
projects[feeds][version] = 2.0-alpha5

projects[fivestar][subdir] = contrib
projects[fivestar][download][type] = git
projects[fivestar][download][url] = http://git.drupal.org/sandbox/googletorp/1255156.git
projects[fivestar][download][revision] = b38930ff1890f88c63f293bae65b3c6913b6c1e6

projects[job_scheduler][subdir] = contrib
projects[job_scheduler][version] = 2.0-alpha3

projects[libraries][subdir] = contrib
projects[libraries][version] = 1.0

projects[link][subdir] = contrib
projects[link][version] = 1.0

projects[mailhandler][subdir] = contrib
projects[mailhandler][version] = 2.5

projects[nanosoap][subdir] = contrib
projects[nanosoap][download][type] = git
projects[nanosoap][download][url] = http://git.drupal.org/project/nanosoap.git
projects[nanosoap][download][revision] = 5f7e56dbbaca4c894dc69a96c0b23fb83c2a85b7

projects[profile2][subdir] = contrib
projects[profile2][version] = 1.3

projects[search_api][subdir] = contrib
projects[search_api][version] = 1.4

projects[search_api_solr][subdir] = contrib
projects[search_api_solr][version] = 1.0-rc3

projects[token][subdir] = contrib
projects[token][version] = 1.4

projects[uuid][subdir] = contrib
projects[uuid][download][type] = git
projects[uuid][download][url] = http://git.drupal.org/project/uuid.git
projects[uuid][download][revision] = 22c3ae3f24e19ad411f14cb08b854895d4a6721b

projects[views][subdir] = contrib
projects[views][version] = 3.5

projects[votingapi][subdir] = contrib
projects[votingapi][version] = 2.10

; Ting module

projects[osa_addi][subdir] = contrib
projects[osa_addi][type] = module
projects[osa_addi][download][type] = git
projects[osa_addi][download][url] = https://github.com/DBC-as/Vopros-opensearch-admin.git

projects[ting][type] = "module"
projects[ting][download][type] = "git"
projects[ting][download][url] = "https://github.com/ding2/ting.git"
projects[ting][download][tag] = "7.x-0.11"

; Our own module collection
projects[vopros][type] = module
projects[vopros][download][type] = git
projects[vopros][download][url] = "https://github.com/DBC-as/Vopros-base.git"

; Libraries
libraries[search_api_solr_php_client][download][type] = get
libraries[search_api_solr_php_client][download][url] = http://solr-php-client.googlecode.com/files/SolrPhpClient.r22.2009-11-09.zip
libraries[search_api_solr_php_client][directory_name] = SolrPhpClient
libraries[search_api_solr_php_client][destination] = libraries
