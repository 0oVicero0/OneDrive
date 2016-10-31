#!/bin/bash

function Clean()
{
EXE="onedrive"
CheckEXE=`which "$EXE"`
[[ -z "$CheckEXE" ]] &&echo "No found $EXE" && exit 1
ExistEXE=`ps -e |grep "$EXE"`
if [[ -z "$ExistEXE" ]]; then
rm -rf /tmp/*.uplog
else
echo "Task already runing!"
exit 0
fi
}

function Suffix()
{
suffix='AVI|MP4|MKV|RMVB|RM|avi|mp4|mkv|rmvb|rm|webm'
NoFinish='aria2'
}

function WorkDIR()
{
cd /usr/share/nginx/www/download
}

function ReadNoLoad()
{
for rDir in `dir .`
do
cDir=$(pwd)
if [[ -d $rDir ]]; then
cd $rDir
ReadFile;
if [[ `dir -d` == "." ]]; then
cd ..
fi
else
WaitFile=`echo $rDir|awk -F '.' '{ print $NF }' |grep -E "$NoFinish"`
if [[ -n "$WaitFile" ]]; then
if [[ -f "$cDir/$rDir" ]]; then
echo "$rDir" |awk -F '.aria2' '{ print $1 }' |xxd -p |tr -d '\n' >>/tmp/aria2.uplog
echo -e "\n" >>/tmp/aria2.uplog
fi fi fi
done 
}

function ReadFile()
{
for rDir in `dir .`
do
cDir=$(pwd)
if [[ -d $rDir ]]; then
cd $rDir
ReadFile;
if [[ `dir -d` == "." ]]; then
cd ..
fi
else
CheckDIR=`echo $rDir|awk -F '.' '{ print $NF }' |grep -E "$suffix"`
if [[ -n "$CheckDIR" ]]; then
if [[ -f "$cDir/$rDir" ]]; then
NoLoad='`sed -i '1p' /root/aria2.uplog`'
echo "$cDir/$rDir" |xxd -p |tr -d '\n' >>/tmp/Movie.uplog
echo -e "\n" >>/tmp/Movie.uplog 
fi fi fi
done 
}

function Reading()
{
sed -i '/^$/'d /tmp/aria2.uplog
NoFile1=`sed -n '1p' /tmp/aria2.uplog`
NoFile=`echo $NoFile1 |awk -F '0a' '{ print $1 }'`
if [[ -n "$NoFile" ]]; then
sed -i "/$NoFile/d" /tmp/Movie.uplog
sed -i "/$NoFile/d" /tmp/aria2.uplog
Reading;
else
rm -rf /tmp/aria2.uplog
fi
}

function LoadFile()
{
sed -i '/^$/'d /tmp/Movie.uplog
LoadFile=`sed -n '1p' /tmp/Movie.uplog`
if [[ -n "$LoadFile" ]]; then
rLoadFile=`echo $LoadFile |sed 's/\(..\)/%\1/g'`
printf "$(echo -n $rLoadFile |sed 's/\\/\\\\/g;s/\(%\)\([0-9a-fA-F][0-9a-fA-F]\)/\\x\2/g')" >>/tmp/Load.uplog
sed -i "/$LoadFile/d" /tmp/Movie.uplog
LoadFile;
else
rm -rf /tmp/Movie.uplog
fi
}

function FileSize()
{
sed -i '/^$/'d /tmp/Load.uplog
Filesize=`sed -n '1p' /tmp/Load.uplog`
if [[ -n "$Filesize" ]]; then
if [[ -f "$Filesize" ]]; then
SizeNum=`du "$Filesize" |awk '{ print $1 }'`
if [[ "$SizeNum" -ge "204800" ]]; then
du "$Filesize" |awk '{ print $2 }' >>/tmp/UpFiles.uplog
fi fi
sed -i '1d' /tmp/Load.uplog
FileSize;
fi
rm -rf /tmp/Load.uplog
}

function UpLoadFile()
{
sed -i '/^$/'d /tmp/UpFiles.uplog
UpFile=`sed -n '1p' /tmp/UpFiles.uplog`
if [[ -n "$UpFile" ]]; then
if [[ -f "$UpFile" ]]; then
EXEC;
fi
sed -i '1d' /tmp/UpFiles.uplog
UpLoadFile;
fi 
rm -rf /tmp/UpFiles.uplog
}

function EXEC()
{
echo "$UpFile";
"$EXE" "$UpFile";
}

Clean;
Suffix;
WorkDIR;
ReadNoLoad;
ReadFile;
Reading;
LoadFile;
FileSize;
UpLoadFile;