# Requirements
- python3 (Likely Python 3.8 is necessary)
- cron

# Setup
- Ensure the bash scripts and settingsEditMe.sh are executable on your system (chmod).
- Edit your cron by following these steps: 

  ```bash
  crontab -e
  ```
Change the path variable to match your system (pwd will tell you where you are):
```bash
path=/home/oliver/Programs/cronGlycamWebAlive/
0-59/10 * * * * $path/websiteAlive.bash $path  >> $path/webSiteAliveCron.log 2>&1
1-59/10 * * * * $path/crudCleaner.bash $path >> $path/crudCleanerCron.log 2>&1
```
When checking/installing, you can alter frequency to every other minute with e.g. 0-59/2

# Usage
I setup my bashrc like this:

```bash
# Checking if website is alive and reporting it to me everytime I open a terminal. Hacky but whatever.
tail -n1 ~/Programs/cronGlycamWebAlive/activity.log
echo "$(date) <- current date"
```

So every time I open a terminal I get a message on top about the status of the website. If it's been a while, I can manually trigger a check by typing wa (website alive) after setting this up in my bash_aliases:
```bash
alias was='tail -n1 ~/Programs/cronGlycamWebAlive/activity.log'
alias wa='/home/oliver/Programs/cronGlycamWebAlive/websiteAlive.bash /home/oliver/Programs/cronGlycamWebAlive/ >> /home/oliver/Programs/cronGlycamWebAlive/webSiteAliveCron.log 2>&1; was'
```


