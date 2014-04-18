echo "Finding Akeeba Backups..."
find /home*/*/public_html/*/administrator/components/com_akeeba/backup/ -name '*.zip*' >> backupsfound.log
find /home*/*/public_html/administrator/components/com_akeeba/backup/  -name '*.zip*' >> backupsfound.log
echo "Finding Backup Buddy Backups..."
find /home*/*/public_html/wp-content/uploads/backupbuddy_backups/ -name '*.zip' >> backupsfound.log
find /home*/*/public_html/*/wp-content/uploads/backupbuddy_backups/ -name '*.zip' >> backupsfound.log
echo "Finding Large Zip files. (DotZipNuke)..."
find /home*/* -type f -name '*.zip*' -size +500M >> backupsfound.log
echo "Done! Check backupsfound.log"


