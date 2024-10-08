#!/bin/bash
 
set -o errexit # fail if anything fails
set -o nounset # fail if variable not set
set -o pipefail # correct exitcode for piped commands
# set -o xtrace # Uncomment this line for debugging purpose

function run_test() {
  os=${1}
  os_version=${2}
  echo "=================================================="
  echo "testing: ${os} version: ${os_version}"
  echo "=================================================="

  docker run --rm -it \
    -v $(pwd):/molecule/ansible-maven \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -w /molecule/ansible-maven \
    -e TAG=24.08.25 \
    org.tecris/molecule:24.09.14 \
    molecule test -s ${os}_${os_version}
}

declare -A distrubution_array
distrubution_array[debian]="11,12"
distrubution_array[ubuntu]="20.04,22.04,24.04"

for distribution in "${!distrubution_array[@]}"
do
  os=${distribution}
  os_version_list=${distrubution_array[${distribution}]}
  for os_version in ${distrubution_array[${distribution}]//,/ }
  do
    run_test ${os} ${os_version}
  done
done
