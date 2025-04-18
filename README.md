# 📁 System Automation Projects

This repository contains two automation projects designed to improve system administration tasks using **Bash scripting** and **Ansible**. These projects aim to simplify daily backups and automate the deployment of a full **LAMP stack** environment.

---

## 📂 Project Structure

```plaintext
.
├── Task1_Bash-Script
│   ├── BackUps_Script.sh       # Bash script for automated backups
│   └── readme.md               # Documentation for the backup script
│
└── Task2-Asnible
    ├── Auto_LAMP_Stack.yaml    # Ansible playbook for LAMP deployment
    ├── inventories
    │   ├── dev/hosts.ini       # Inventory file for development
    │   └── prod/hosts.ini      # Inventory file for production
    ├── roles
    │   ├── apache/             # Apache role with tasks, handlers, and a template
    │   │   ├── tasks/main.yaml
    │   │   ├── handlers/main.yaml
    │   │   └── templates/index.php.j2
    │   ├── firewall/tasks/main.yaml
    │   ├── mysql/tasks/main.yaml
    │   └── php/tasks/main.yaml
    └── vars/all.yaml           # Global variables for the playbook

## 🧰 Task 1: Bash Script – Automated Backup System

📁 **Location:** `Task1_Bash-Script/BackUps_Script.sh`

This script automates the process of backing up critical directories on your system. It compresses data, manages retention for both backups and logs, and sends an email alert if the backup process fails.

---

### 🔧 Features

- 📦 Compresses and stores backups with timestamps
- ♻️ Automatically removes old backups based on retention settings
- 🧹 Rotates log files to conserve disk space
- 📧 Sends email alerts on backup failure
- 🔧 Installs `mailutils` if not already installed
- 📆 Supports scheduling via `cron` for daily automation

---

### ⚙️ Configuration

Before running the script, you can modify the following variables at the top of the file:

```bash
src_dir="/var/www"                     # Directory to back up
dest_dir="/Backup_dir"                # Destination directory for backups
backup_retain=7                       # Number of backups to retain
log_file="/var/log/daily_backup.log"  # Central log file
log_retain=5                          # Number of log files to retain
Email="you@example.com"               # Email address to receive failure alerts

## 🚀 Task 2: Ansible – Deploying a LAMP Stack

📁 **Location:** `Task2-Asnible/Auto_LAMP_Stack.yaml`

This Ansible playbook automates the deployment of a complete **LAMP stack** (Linux, Apache, MySQL, PHP) across one or more remote servers.

---

### 🔧 Features

- ✅ Installs and configures **Apache**, **MySQL**, and **PHP**
- 📝 Deploys a sample `index.php` template to verify setup
- 🔒 Configures **UFW firewall rules** to allow web traffic (HTTP/HTTPS)
- 🌍 Separates environments using inventory directories (`dev`, `prod`)
- 🧩 Uses modular **Ansible roles** for maintainability and clarity

---

---

## 🙌 Final Thoughts

These projects are great starting points for automating routine system administration tasks and deploying web environments with ease. Whether you're managing backups or provisioning servers, automation saves time and reduces the risk of human error. Feel free to explore, customize, and build upon these solutions to fit your own infrastructure needs.

Happy Automating! 🚀

