# 🌐 Deploy LAMP Stack with Ansible

This project provides an **Ansible playbook** to deploy a complete **LAMP stack** (Linux, Apache, MySQL, PHP) on web server(s). The playbook automates the installation and configuration of the required components to set up a fully functional web server.

---

## 📦 Features

- ✔️ Installs **Apache**, **MySQL**, and **PHP**
- 🔒 Configures basic **firewall rules** for security
- 🖥️ Can be easily customized for other servers or environments
- 📜 Uses Ansible roles for clear separation of tasks

---

## 🚀 Requirements

Before running the playbook, make sure you have the following:

### 1. **Ansible Installed**

If you don't have Ansible installed, follow the [official installation guide](https://docs.ansible.com/ansible/latest/installation_guide/index.html) for your operating system.

### 2. **Inventory File**

Ensure you have a properly configured **inventory file** where your web servers are listed under the `webservers` group. Example:

```ini
[webservers]
your-webserver-ip-or-hostname

### 3. Sudo Privileges

The playbook requires become: true to run tasks with elevated privileges, so make sure your user has sudo permissions.
