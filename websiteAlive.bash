#!/bin/bash

path=/home/oliver/Dropbox/scripts/websiteChecker/
activityLog=$path/activity.log
apiOutput=$path/apiOutput.txt

#Hit the cb api to build DManpa
python3 $path/api-https.py glycam.org $path/build_sequence.json > $apiOutput
# If this sequence ID exists in the output, grpc etc is working
if grep -q "fc6085c0-822c-5655-b5be-88da496814cb" $apiOutput
then
    #toDo # kick the watchdog
    echo "$(date) : Website is fine" >> $activityLog    
else
    if [ "$(ping -c 1 google.com)" ]; then
        echo "$(date) : Both google and glycam are unreachable, likely your internet is down dog" >> $activityLog
    else
        echo "$(date) : Google is up but glycam.org tain't Fine Nor Dandy, send email now" >> $activityLog
    fi
fi
