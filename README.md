# Puppet
How I install my basic preferences on a new OS.
This requires a host that is running Puppet.
The file my_OS_setup.pp should be run as root.  It installs my favorite packages.
And my_User_setup.pp should be run as a user who wants my dot files.
To run:
puppet apply {filename}.pp

Mike
