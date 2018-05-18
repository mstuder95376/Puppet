# My new Linux system setup
# OS setup should be run as root
# First install my favorite packages
class my_pkgs{
    $my_packages = [ 'screen', 'tmux', 'vim', 'filezilla', 'meld', 'gcc', 'make', 'ansible', 'git', 'atom', 'openssh', 'glances', 'eclipse' ]
    package { $my_packages: ensure => 'installed' }
}


# To invoke these new classes
include my_pkgs
