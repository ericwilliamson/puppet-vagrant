# Public: Installs Vagrant 1.4.2
#
# Usage:
#
#   include vagrant

class vagrant(
  $version = 1.4.2,
){

  case $version {
    /^1\.4/   : { $download_source = 'https://dl.bintray.com/mitchellh/vagrant/Vagrant-$version.dmg' }
    /1\.3\.5/ : { $download_source = 'http://files.vagrantup.com/packages/a40522f5fabccb9ddabad03d836e120ff5d14093/Vagrant-1.3.5.dmg' }
    /1\.3\.4/ : { $download_source = 'http://files.vagrantup.com/packages/0ac2a87388419b989c3c0d0318cc97df3b0ed27d/Vagrant-1.3.4.dmg' }
    /1\.3\.3/ : { $download_source = 'http://files.vagrantup.com/packages/db8e7a9c79b23264da129f55cf8569167fc22415/Vagrant-1.3.3.dmg' }
    default   : { fail("Unrecognized version") }
  }

  package { "Vagrant_$version":
    ensure   => installed,
    source   => $download_source,
    provider => 'pkgdmg'
  }

  file { "/Users/${::boxen_user}/.vagrant.d":
    ensure => directory
  }
}
