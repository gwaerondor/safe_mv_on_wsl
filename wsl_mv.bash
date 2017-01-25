#!/bin/bash

to_safe() {
    echo "${1}" | sed "s|/$||g"
}

print_safe() {
    for param in ${@}
    do
	echo -n "$(to_safe ${param}) "
    done    
}

echo "$(print_safe ${@})" | xargs /bin/mv
