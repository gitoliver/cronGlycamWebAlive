#!/bin/bash
if [ $# -ne 1 ]; then
    echo "No path given to $0. Exiting"
    exit 1
fi
path=$1
# Source the website, pingWebsite and uuidInResponse variables
source $path/settingsEditMe.sh
activityLog=$path/activity.log
apiOutput=$path/apiOutput.txt

#Hit the cb api to build DManpa
>$apiOutput #ensure this is empty
python3 $path/api-https.py $website $path/build_sequence.json > $apiOutput
# uncomment line below for testing emails.
uuidInResponse="000"
# If this sequence ID exists in the output, grpc etc is working
if grep -q "$uuidInResponse" $apiOutput
then
    #toDo # kick the watchdog
    echo "$(date) : $website is fine, uuid used: $uuidInResponse" >> $activityLog    
else
    if [ "$(ping -c 1 $pingWebsite)" ]; then
        echo "$(date) : Both $pingWebsite and $website are unreachable, likely your internet is down dog" >> $activityLog
    else
        echo "$(date) : $pingWebsite is ping-able but $website isn't responding normally to api requests, send email to $emailTo using this email server $emailServer" >> $activityLog
        #send the email
	echo "$(date) : $pingWebsite is ping-able but $website isn't responding normally to api requests." | mail --subject="$website api not responding correctly" $emailTo
    fi
fi
