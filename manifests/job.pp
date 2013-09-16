define jenkins_jobs::job (
  $ensure  = 'present',
  $content = undef,
  $source  = undef,
) {
  $job_dir = "${jenkins_jobs::jobs_dir}/${name}"
  $work_dir = "${job_dir}/workspace"

  if $ensure == 'present' {
    $directory_ensure = 'directory'
  } else {
    $directory_ensure = 'absent'
  }

  File {
    owner => $jenkins_jobs::jenkins_user,
    group => $jenkins_jobs::jenkins_group,
    mode  => '0644',
  }

  file { "${job_dir}": ensure => $directory_ensure, }

  file { "${work_dir}": ensure => $directory_ensure, }

  file { "${job_dir}/config.xml":
    ensure  => $ensure,
    content => $content,
    source  => $source,
  }
}