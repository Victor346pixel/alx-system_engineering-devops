# Creates a file
file { '/tmp/school':
  ensure  => 'file',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
<<<<<<< HEAD
  content => 'I love Puppet',
=======
  content => 'I love Puppet'
>>>>>>> f25730e92141517eff77bfd72ce57432810b24b4
}
