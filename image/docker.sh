#!/bin/bash

while true; do
  export now="$(date --rfc-3339=seconds)"
  export msg="pod with docker"
  export level="INFO"


    echo '{ "timestamp": "$now", "level": "$level", "message": "$msg"}' | envsubst >> /dev/fd/2

  sleep 2
done
