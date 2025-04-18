# 🗄️ Automated Daily Backup Script (Bash)

This project provides a Bash script to automate daily backups of a specified directory on a Linux system. It supports compression, log rotation, failure detection with email alerts, and is designed for scheduled execution via cron.

---

## 📦 Features

- ✅ Creates compressed, timestamped backups of any directory
- 🔁 Rotates old backups and keeps only the most recent
- 📝 Maintains centralized logs and deletes older logs automatically
- 📧 Sends an email alert if a backup fails
- 🕒 Cron-ready for scheduled daily execution

---

## 🚀 How to Run & Test the Script

### Run Manually

Run the script as root:

```bash
sudo bash backup_script.sh

# 🛠️ Configuration & Failure Testing Guide

This guide explains how to **configure paths and retention** settings for your Bash backup script, and how to **test failure alerts** to ensure your backup monitoring is working correctly.

---

## ⚙️ How to Configure Paths and Retention

The script uses several variables at the top for customization. You can configure the backup and logging behavior by editing the following values inside `backup_script.sh`:

### 🧾 Configuration Variables

| Variable        | Description                                      | Example                          |
|----------------|--------------------------------------------------|----------------------------------|
| `src_dir`       | The directory you want to back up                | `/var/www`                       |
| `dest_dir`      | Where to store the backup archive                | `/Backup_dir`                    |
| `backup_retain` | How many backup files to keep                    | `7`                              |
| `log_file`      | Path to the central log file                     | `/var/log/daily_backup.log`      |
| `log_retain`    | How many older individual log files to keep      | `5`                              |
| `Email`         | Email address to notify in case of failure       | `your@email.com`                 |

### 🔧 Example Snippet from Script

```bash
src_dir="/var/www"
dest_dir="/Backup_dir"
backup_retain=7
log_file="/var/log/daily_backup.log"
log_retain=5
Email="your@email.com"

# 🧪 How to Test the Failure Alert

This guide explains how to **simulate a failure** in your Bash backup script and verify that the **email alert system** is working correctly.

---

## 📌 Purpose

The backup script is designed to automatically notify you via email if the backup process fails. This ensures you are immediately informed of issues that might otherwise go unnoticed.

---

📬 Email Setup Requirements
sudo apt install -y mailutils


