class profile_buildphabricator {

 package {
  'php-pear-PHP-CodeSniffer':
    ensure => installed,
 }

  Class['profile_buildphabricator'] -> Class['profile_jjb']
}
