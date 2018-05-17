# My new Linux system setup

# First install my favorite packages
class my_pkgs{
    $my_packages = [ 'screen', 'tmux', 'vim', 'filezilla', 'meld', 'gcc', 'make', 'ansible', 'git', 'atom' ]
    package { $my_packages: ensure => 'installed' }
}

# Get my dot files downloaded and installed
# Require a wget module
# puppet module install maestrodev-wget
class my_dirs{
    file { '/home/mstuder/GitHub':
        ensure => 'directory',
    }
}

class my_gits{
# https://github.com/mstuder95376/mydotfiles.git
exec { 'mydotfiles':
    command => 'git clone https://github.com/mstuder95376/mydotfiles.git /home/mstuder/GitHub/mydotfiles',
    path    => '/usr/bin/:/bin/',
    # path    => [ '/usr/local/bin/', '/bin/' ],  # alternative syntax
  }
  ->
  exec { 'dotinstall':
      command => 'installer.sh',
      path    => '/home/mstuder/GitHub/mydotfiles/',
    }
}


# To invoke these new classes
#include my_pkgs
#include my_dirs
include my_gits
