# == Class: motd
#
# Module to manage motd
#
class motd (

) {


  #$banner = $::role ? {
  #  'puppetmaster' => "\nYou are on the Puppet Master\n",
  #  'webserver'    => "You are on a Web Server\n",
  #  default        => "\nWelcome to some node\n",
  #}

  case $::role {
    'puppetmaster': {
      $banner = "\nWelcome to the Puppet Master\n"
    }
    'webserver': {
      $banner = "\nWelcome to the Webserver\n"
    }
    default: {
      fail("\nah ah ah. you didnt say the magic word\n")
    }
  }

  file { '/etc/motd':
    ensure  => file,
    content => $banner,
    #source => 'puppet:///modules/motd/motd', 
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
