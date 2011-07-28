api = 2
core = 7.x

; Contrib modules.
projects[apachesolr][subdir] = contrib
projects[apachesolr][version] = 1.0-beta8

projects[ctools][subdir] = contrib
projects[ctools][version] = 1.0-beta1

projects[diff][subdir] = contrib
projects[diff][download][type] = git
projects[diff][download][url] = http://git.drupal.org/project/diff.git
projects[diff][download][revision] = 2b6ab3841bb5f23f5c7d5848034442414e5992db

projects[entity][subdir] = contrib
projects[entity][version] = 1.0-beta9

projects[feeds][subdir] = contrib
projects[feeds][version] = 2.0-alpha4

projects[fivestar][subdir] = contrib
projects[fivestar][download][type] = git
projects[fivestar][download][url] = http://git.drupal.org/project/fivestar.git
projects[fivestar][download][revision] = fec4de45bc3c78bbedae31c3bcf1d5e6ed1b87c0

projects[job_scheduler][subdir] = contrib
projects[job_scheduler][version] = 2.0-alpha2

projects[mailhandler][subdir] = contrib
projects[mailhandler][download][type] = git
projects[mailhandler][download][url] = http://git.drupal.org/sandbox/googletorp/1173376.git
projects[mailhandler][download][revision] = bddc3b9e3b41bcb4b22e1cafa5eee2e522517eab

projects[nanosoap][subdir] = contrib
projects[nanosoap][download][type] = git
projects[nanosoap][download][url] = http://git.drupal.org/project/nanosoap.git
projects[nanosoap][download][revision] = 5f7e56dbbaca4c894dc69a96c0b23fb83c2a85b7

projects[profile2][subdir] = contrib
projects[profile2][version] = 1.0-beta4

projects[search_api][subdir] = contrib
projects[search_api][version] = 1.0-beta10

projects[search_api][subdir] = contrib
projects[search_api][version] = 1.0-beta3

projects[token][subdir] = contrib
projects[token][version] = 1.0-beta1

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

; Since drush will find the ting.make file and download it's contents instead
; of the ting module, we list it as a library which will clone the repo instead.
libraries[ting][download][type] = git
libraries[ting][download][url] = git@github.com:ding2/ting.git
libraries[ting][destination] = modules/contrib

; Stuff needed by ting module. We list it here to avoid conflicts with nanosoap
; being listed twice.
projects[ding_entity][subdir] = contrib
projects[ding_entity][type] = module
projects[ding_entity][download][type] = git
projects[ding_entity][download][url] = git@github.com:ding2/ding_entity.git

libraries[ting-client][download][type] = git
libraries[ting-client][download][url] = https://github.com/DBC-as/Vopros-base.git
libraries[ting-client][destination] = modules/contrib/ting/lib

; Our own module collection
projects[vopros][type] = module
projects[vopros][download][type] = git
projects[vopros][download][url] = git@github.com:DBC-as/Vopros-base.git

