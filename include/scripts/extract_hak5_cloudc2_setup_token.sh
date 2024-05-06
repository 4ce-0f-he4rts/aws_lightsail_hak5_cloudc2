#! /bin/bash
echo 'Extracting Setup Token from /var/log/cloud-init-output.log >> /home/ubuntu/hak5_cloudc2_setup_token.txt...'
sleep 50 # if remote-exec breaks, then increase sleep time to "30+ secs" to give time for /var/log/cloud-init-output.log to complete.
sudo cat /var/log/cloud-init-output.log | grep -A 150 'Processing triggers for ' >> /home/ubuntu/hak5_cloudc2_setup_token.txt
echo 'Extraction Complete!'
sleep 5