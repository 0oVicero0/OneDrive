# [OneDrive for Business on Bash]

-------------------------------------------------------------------------
使用方法:     
请参照该文章       
https://moeclub.org/2017/03/17/24/        

-------------------------------------------------------------------------
特性:      
1.支持文件夹上传.      
2.支持获取文件的匿名直链.     
3.纯shell支持.      

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

#####################################################################
Usage: onedrive [OPTIONS] file1 [file2...]
       onedrive-d folder

Options:
  -d, --debug        Enable debug mode
  -a, --authorize    Run authorization process
  -f, --folder       Upload files into this remote folder
  -c, --creat        Creat remote folder."
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
  -ls,--list         Show the itmes in this directory.
  -l, --link         Show the file share link.
      
#####################################################################
      
```
