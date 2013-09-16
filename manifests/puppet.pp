define jenkins_jobs::puppet (
  $name,
  $description,
  $ensure              = 'present',
  $git_url,
  $scmpoll_spec        = '* * * * *',
  $concurrent_build    = false,
  $rvm_use             = 'ruby-1.9.2-p290@puppet',
  $ci_reporter_version = '1.9.0',) {
  jenkins_jobs::job { "${name}":
    ensure  => $ensure,
    content => template('jenkins_jobs/puppet-config.xml.erb'),
  }
}
