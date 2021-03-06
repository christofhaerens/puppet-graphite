# Class: graphite
#
# This module manages graphite
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class graphite::web::auth inherits graphite::web {

  file {'/etc/httpd/conf.d/graphite-web.conf':
    ensure    => file,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => Service[$graphite::web::web_service_name],
    content   => template('graphite/web/graphite-web.conf.erb');
  }

  file {"${graphite::web::web_graphite_root}.htpasswd":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "${graphite::web::web_basic_http_user}:${graphite::web::web_basic_http_password}",
  }
}
