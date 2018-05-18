# My new Linux system setup
# User setup should be run as the user
# =============== CONFIG ===============
# Specifiy username here:
$username = "mstuder"

# =============== CLASSES ==============
# Create GItHub directory if missing
class my_dirs {
    file { "/home/${username}/GitHub" :
        ensure => 'directory',
    }
}


class rm_mydotfiles {
    file { "/home/${username}/GitHub/mydotfiles" :
    ensure  => absent,
    force => yes,
    }
}


class my_gits {
# https://github.com/mstuder95376/mydotfiles.git
# Make sure directory is not already there.
exec { 'mydotfiles' :
    command => 'git clone https://github.com/mstuder95376/mydotfiles.git /home/mstuder/GitHub/mydotfiles',
    path    => '/usr/bin/:/bin/',
    # path    => [ '/usr/local/bin/', '/bin/' ],  # alternative syntax
  }
}


class install_dots {
  exec { 'dotinstall' :
      command => 'installer.sh',
      path    => "/home/${username}/GitHub/mydotfiles/",
    }
}


# Invoke these new classes
# ============ MAIN ============
include my_dirs
include rm_mydotfiles
include my_gits
include install_dots
