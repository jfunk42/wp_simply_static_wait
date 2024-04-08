#!/bin/bash

for i in {1..100}
do
        status=$(sudo wp eval 'echo Simply_Static\Plugin::instance()->get_archive_creation_job()->is_running();')
        echo "$status"


        if ! grep -q '1' <<< "$status"
        then
                echo "Done"
                exit 0
                break
        fi
        sleep 30s
done
echo "Error in wp_simply_static_wait.sh"
exit 1
