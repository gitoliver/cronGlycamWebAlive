# Requirments
python3 (Likely Python 3.8 is necessary)
cron

# Setup
Ensure the bash scripts and settingsEditMe.sh are executable on your system (chmod).
Edit your cron entry

```bash
crontab -e
```
Change the path variable to match your system (pwd):
```bash
path=/home/oliver/Programs/cronGlycamWebAlive/
0-59/10 * * * * $path/websiteAlive.bash $path  >> $path/webSiteAliveCron.log 2>&1
1-59/10 * * * * $path/crudCleaner.bash $path >> $path/crudCleanerCron.log 2>&1
```
When checking/installing, you can alter frequency to every other minute with e.g. 0-59/2

# Usage
### websiteAlive.bash
Look at activity.log for the latest information.

### crudCleaner.bash
Keeps the logs short and removes all the build_sequence json responses that pile up.
