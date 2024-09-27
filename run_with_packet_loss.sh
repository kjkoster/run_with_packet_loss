#!/bin/bash

python /app/app.py &

current_loss=10
tc qdisc add dev eth0 root netem loss ${current_loss}%
tc qdisc change dev eth0 root netem delay 500ms 100ms

while true; do
    if [ "${current_loss}" -eq 10 ]; then
        current_loss=90
        sleep_time=$((5 + ${RANDOM} % 20))
    else
        current_loss=10
        sleep_time=$((30 + ${RANDOM} % 40))
    fi

    echo "Packet loss will be ${current_loss} for the next ${sleep_time} seconds..."
    tc qdisc change dev eth0 root netem loss ${current_loss}%
    sleep $sleep_time
done

