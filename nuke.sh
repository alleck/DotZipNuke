#!/bin/bash

if [ ! -d "/home/sscan/backLogs" ]
then
mkdir /home/sscan/backLogs
chmod 755 /home/sscan/backLogs
fi

fileBackLog="$(date +%y%m%d%H%M)_backfind.log"
echo $fileBackLog

echo -e "\e[093;1mFinding Akeeba Backups...\e[0m"
find /home*/*/public_html/*/administrator/components/com_akeeba/backup/ -name '*.zip*' >> backupsfound.log
find /home*/*/public_html/administrator/components/com_akeeba/backup/  -name '*.zip*' >> backupsfound.log
echo -e "\e[092;1mFinished Akeeba Backups\e[0m"
echo -e "\e[093;1mFinding Backup Buddy Backups...\e[0m"
find /home*/*/public_html/*/wp-content/uploads/backupbuddy_backups/ -name '*.zip' >> backupsfound.log
find /home*/*/public_html/wp-content/uploads/backupbuddy_backups/ -name '*.zip' >> backupsfound.log
echo -e "\e[092;1mFinished Backup Buddy Backups\e[0m"
echo -e "\e[093;1mFinding Large Zip files. (DotZipNuke)...\e[0m"
find /home*/* -type f -name '*.zip*' -size +200M >> backupsfound.log
echo -e "\e[093;1mDone! Check backupsfound.log\e[0m"


for file in `cat backupsfound.log | cut -d":" -f1`
do
        ls -lh $file | awk '{print $5,$9;}' >> ./backLogs/$fileBackLog
done

echo "Results can be found in /home/sscan/backLogs/"$fileBackLog
echo "Done!"


# previous code
# echo "Finding Akeeba Backups..."
# find /home*/*/public_html/*/administrator/components/com_akeeba/backup/ -name '*.zip*' >> backupsfound.log
# find /home*/*/public_html/administrator/components/com_akeeba/backup/  -name '*.zip*' >> backupsfound.log
# echo "Finding Backup Buddy Backups..."
# find /home*/*/public_html/wp-content/uploads/backupbuddy_backups/ -name '*.zip' >> backupsfound.log
# find /home*/*/public_html/*/wp-content/uploads/backupbuddy_backups/ -name '*.zip' >> backupsfound.log
# echo "Finding Large Zip files. (DotZipNuke)..."
# find /home*/* -type f -name '*.zip*' -size +500M >> backupsfound.log
# echo "Done! Check backupsfound.log"
