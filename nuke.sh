
echo "Finding Akeeba Backups..."
find /home*/* -type d -name '*akeeba*' >> backupsfound.log
echo "Finding Backup Buddy Backups..."
find /home*/* -type d -name '*backupbuddy_backups*' >> backupsfound.log
echo "Finding Large Zip files. (DotZipNuke)..."
find /home*/* -type f -name '*.zip*' -size +500M >> backupsfound.log
echo "Done! Check backupsfound.log"
