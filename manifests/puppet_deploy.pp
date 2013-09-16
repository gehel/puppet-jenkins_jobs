define jenkins_jobs::puppet_deploy (
  $name,
  $description,
  $ensure           = 'present',
  $concurrent_build = false,
  $target_environment,
  $downstream_job   = undef,) {
  jenkins_jobs::job { "${name}":
    ensure  => present,
    content => template('jenkins_jobs/puppet_deploy-config.xml.erb'),
  }
}
