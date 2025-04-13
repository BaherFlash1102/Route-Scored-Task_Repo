#!/bin/bash

# Task1 || Bash script to perform automated daily system backups

# === CONFIGURATION ===
src_dir="/var/www"                   # Directory to back up
dest_dir="/Backup_dir"              # Directory to store backups
backup_retain=7                     # Number of backups to keep
log_file="/var/log/daily_backup.log"
log_retain=5                        # Number of log files to retain
Email="baher0.hesham0.ali0@gmail.com"
Time_Stamp=$(date '+%Y-%m-%d_%H-%M-%S')
Backup_name="backup_$Time_Stamp.tar.gz"
Current_log="/var/log/daily_backup_$Time_Stamp.log"

# === Ensure that the user runs a code as a root script ===
if [[ "$EUID" -ne 0 ]]; then
    echo "Please run this script as root (use sudo)"
    exit 1
fi

# === Ensure mailutils is installed ===
if ! command -v mail &>/dev/null; then
  echo "mailutils not installed. Installing..." | tee -a "$Current_log"
  apt install -y mailutils >> "$Current_log" 2>&1
fi

# === Ensure destination directory exists ===
mkdir -p "$dest_dir"

echo "[$(date)] Starting backup..." | tee -a "$Current_log"

# === BACKUP ===
if tar -czf "$dest_dir/$Backup_name" "$src_dir" >> "$Current_log" 2>&1; then
    echo "[$(date)] Backup successful: $Backup_name" | tee -a "$Current_log"
else
    echo "[$(date)] Backup FAILED for $src_dir!" | tee -a "$Current_log"
    mail -s "Backup Failed on $(hostname)" "$Email" < "$Current_log"
    exit 1
fi

# === ROTATE BACKUPS ===
echo "[$(date)] Rotating old backups..." >> "$Current_log"
ls -1t "$dest_dir"/backup_*.tar.gz | tail -n +$((backup_retain + 1)) | xargs -r rm -f >> "$Current_log" 2>&1

# === ROTATE LOGS ===
cp "$Current_log" "$log_file" # Keep one central log file
ls -1t /var/log/daily_backup_*.log | tail -n +$((log_retain + 1)) | xargs -r rm -f

echo "[$(date)] Backup process completed." >> "$Current_log"

0 0 * * * /path/to/your/backup_script.sh >> /var/log/backup_cron.log 2>&1