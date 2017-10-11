exec { "apt-update":
  command => "/usr/bin/apt-get update"
}

package { ["mysql-server"]:
  ensure => installed,
  require => Exec["apt-update"]
}

service { "mysql":
  ensure => running,
  enable => true,
  hasstatus => true,
  hasrestart => true,
  require => Package["mysql-server"]
}

exec { "dbintelie":
  command => "mysqladmin -uroot create dbintelie",
  path => "/usr/bin",
  unless => "mysql -uroot dbintelie",
  require => Service["mysql"]
}


exec { "mysql-password":
  command => "mysql -uroot -e \"GRANT ALL PRIVILEGES ON * TO 'administrator'@'%' IDENTIFIED BY 'admin';\" dbintelie",
  unless => "mysql -uadministrator -padmin dbintelie",
  path => "/usr/bin",
  require => Exec[dbintelie] 
}
