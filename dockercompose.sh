#!/bin/bash
f [ -z "$STY" ]; then exec screen -dm -S docker /bin/bash "$0"; 
fi

docker-compose -f ~/docker-compose.yml up

