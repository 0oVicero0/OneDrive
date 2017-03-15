# [OneDrive for Business on Bash]

-------------------------------------------------------------------------

# Install
```
wget --no-check-certificate -q -O /tmp/OneDrive.sh "https://raw.githubusercontent.com/0oVicero0/OneDrive/master/OneDrive.sh" && bash /tmp/OneDrive.sh

```
# Authorize
```
onedrive -a

```
# Help
```
onedrive --help

#######################################################
Usage: onedrive [OPTIONS] file1 [file2...]

Options:
  -d, --debug        Enable debug mode
  -a, --authorize    Run authorization process
  -f, --folder       Upload files into this remote folder
                     Directory names are separated with a slash, e.g.
                     rootFolder/subFolder
                     Do NOT use a trailing slash!
  -h, --help         Show this help
  -r, --rename       Rename the files during upload
                     For each file you specify you MUST also specify
                     the remote filename as the subsequent parameter
                     Be especially careful with globbing!
  -s, --silent       Silent mode for use in crontab scripts.
                     Return only exit code.
  -l, --list         Show the itmes in this directory.
      --link         Show the file share link.
      
```
