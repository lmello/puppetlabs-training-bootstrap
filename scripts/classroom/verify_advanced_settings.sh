source functions.sh

echo "Verifying Advanced classroom setup:"

###### start running checks ######

check "[ '`hostname`' == '${NAME}.puppetlabs.vm' ]"                 \
      "Checking hostname"                                           \
      "You should set the hostname to ${NAME}.puppetlabs.vm"

# `hostname -s` should be alphanumeric, can contain underscores, and 
# contain at least one alphabetical character, with no caps, and finally,
# not be composed of all numerals:
check "echo `hostname -s` | grep -Pq '^(?=.*[a-z])\A[a-z0-9][a-z0-9._]+\z' " \
      "Checking hostname validity"                                  \
      "Hostnames should be alphanumeric with at least one alphabhetical character"

check "grep HOSTNAME=${NAME}.puppetlabs.vm /etc/sysconfig/network"  \
      "Checking that the hostname will be set on boot"              \
      "You should set HOSTNAME=${NAME}.puppetlabs.vm in /etc/sysconfig/network"

check "ping -c1 classroom.puppetlabs.vm"                               \
      "Checking master name resolution"                             \
      "You should have an entry in /etc/hosts for classroom.puppetlabs.vm"

check "ping -c1 ${NAME}.puppetlabs.vm"                              \
      "Checking local hostname resolution"                          \
      "You should have an entry in /etc/hosts for ${NAME}.puppetlabs.vm"
