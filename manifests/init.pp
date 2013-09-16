# Class: nnjenkins
#
# This module manages nnjenkins
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class jenkins_jobs (
  $jenkins_home  = '/var/lib/jenkins',
  $jobs_dir      = '/var/lib/jenkins/jobs',
  $jenkins_user  = 'jenkins',
  $jenkins_group = 'jenkins',
  $jenkins_email = 'jenkins@example.net',
) {
  File {
    owner => $jenkins_jobs::jenkins_user,
    group => $jenkins_jobs::jenkins_group,
    mode  => '0644',
  }

  file { "${jobs_dir}": ensure => directory, }

}
