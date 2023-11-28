# cron
Do crontab -e and add these lines with your paths
0-59/30 * * * * /home/oliver/Dropbox/scripts/websiteChecker/websiteAlive.bash  >> /home/oliver/Dropbox/scripts/websiteChecker/cron.log 2>&1

# websiteAlive.bash
Ran regularly by cron.
Look at activity.log for the latest information.

# crudCleaner.bash
Ran regularly by cron.
Keeps the logs short and removes all the build_sequence json responses that pile up.
