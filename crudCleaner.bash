#!/bin/bash
if [ $# -ne 1 ]; then
    echo "No path given to $0. Exiting"
    exit 1
fi
path=$1
# Keep logs from getting too long
logFileList=("activity.log" "webSiteAliveCron.log" "crudCleanerCron.log")
for log in "${logFileList[@]}"; 
do
    tail -480 $path/$log > $path/tmp
    mv $path/tmp $path/$log
done

# Delete all the json responses
rm $path/build_sequence.json.2*.Response.json
