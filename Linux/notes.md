# Linux Fundamentals Notes

## 1. Navigating the Filesystem

Linux follows a hierarchical directory structure.

### Important Commands

```bash
pwd
```

Shows current working directory.

```bash
ls
```

Lists files and directories.

```bash
ls -la
```

Shows hidden files and detailed information.

```bash
cd /path
```

Changes directory.

### Important Directories

```text
/        Root Directory
/home    User Home Directories
/etc     Configuration Files
/var     Logs and Variable Data
/tmp     Temporary Files
/bin     Essential Commands
```

---

## 2. Basic File Editing

### Nano

```bash
nano file.txt
```

Simple text editor for beginners.

### Vim

```bash
vim file.txt
```

Powerful terminal-based editor.

---

## 3. Moving and Renaming Files

### Move File

```bash
mv file.txt /home/user/Documents
```

### Rename File

```bash
mv old.txt new.txt
```

The `mv` command is used for both moving and renaming files.

---

## 4. Bash Configuration File

### .bashrc

```bash
nano ~/.bashrc
```

Used to customize shell behavior.

Common Uses:

* Aliases
* Environment Variables
* Custom Prompts

Apply changes:

```bash
source ~/.bashrc
```

---

## 5. Command Aliases

Aliases create shortcuts for commands.

Example:

```bash
alias ll='ls -la'
```

Usage:

```bash
ll
```

Permanent aliases should be added to `.bashrc`.

---

## 6. Understanding Permissions

Linux permissions determine who can access files.

Example:

```bash
-rwxr-xr--
```

### Meaning

```text
Owner  Group  Others
rwx    r-x    r--
```

### Permission Types

```text
r = Read
w = Write
x = Execute
```

Check permissions:

```bash
ls -l
```

---

## 7. Changing Permissions Numerically

### chmod

```bash
chmod 755 script.sh
```

Meaning:

```text
7 = rwx
5 = r-x
5 = r-x
```

Common Values:

```text
777 = Full Access
755 = Executable Files
644 = Regular Files
600 = Private Files
```

---

## 8. Checking Resource Usage

### CPU and Memory

```bash
top
```

or

```bash
htop
```

### Disk Usage

```bash
df -h
```

### Directory Size

```bash
du -sh foldername
```

---

## 9. Package Management

Package managers install and update software.

### Ubuntu/Debian

```bash
sudo apt update
sudo apt install nginx
```

### Fedora

```bash
sudo dnf install nginx
```

### CentOS

```bash
sudo yum install nginx
```

---

## 10. Managing systemd Units

systemd manages services.

### Start Service

```bash
sudo systemctl start nginx
```

### Stop Service

```bash
sudo systemctl stop nginx
```

### Enable at Boot

```bash
sudo systemctl enable nginx
```

### Check Status

```bash
sudo systemctl status nginx
```

---

## 11. Viewing Logs

### Journal Logs

```bash
journalctl
```

View latest logs:

```bash
journalctl -xe
```

View logs for a service:

```bash
journalctl -u nginx
```

---

## 12. Managing Users

### Create User

```bash
sudo useradd username
```

### Set Password

```bash
sudo passwd username
```

### Delete User

```bash
sudo userdel username
```

### Switch User

```bash
su username
```

---

## 13. Bash History

View command history:

```bash
history
```

Run command from history:

```bash
!100
```

Search history:

```bash
Ctrl + R
```

---

## 14. Output Redirection

### Redirect Output

```bash
ls > output.txt
```

### Append Output

```bash
ls >> output.txt
```

### Redirect Errors

```bash
command 2> error.log
```

---

## 15. Streams

Linux has three streams:

```text
0 = stdin
1 = stdout
2 = stderr
```

Examples:

```bash
cat < file.txt
ls > output.txt
command 2> errors.log
```

---

## 16. Variables

Create Variable:

```bash
name="Shubham"
```

Access Variable:

```bash
echo $name
```

Environment Variable:

```bash
export APP_ENV=production
```

---

## 17. The Find Command

Search files:

```bash
find /home -name "*.txt"
```

Find directories:

```bash
find /home -type d
```

Find files larger than 100MB:

```bash
find / -size +100M
```

---

## 18. Package Management on Fedora and CentOS

### Fedora

```bash
sudo dnf install package-name
```

Update:

```bash
sudo dnf update
```

### CentOS

```bash
sudo yum install package-name
```

Update:

```bash
sudo yum update
```

---

## 19. Remote Management with OpenSSH

Connect to remote server:

```bash
ssh ubuntu@server-ip
```

Connect using key:

```bash
ssh -i key.pem ubuntu@server-ip
```

Commonly used for AWS EC2 management.

---

## 20. Transferring Files with SCP

Copy local file to server:

```bash
scp file.txt ubuntu@server-ip:/home/ubuntu
```

Copy server file to local machine:

```bash
scp ubuntu@server-ip:/home/ubuntu/file.txt .
```

---

## 21. Transferring Files with rsync

Sync files efficiently:

```bash
rsync -avz source/ destination/
```

Remote Sync:

```bash
rsync -avz project/ ubuntu@server-ip:/home/ubuntu/project
```

Advantages:

* Faster than SCP
* Transfers only changed files
* Supports compression

---

# Interview Questions

### What is Linux?

Linux is an open-source operating system widely used in servers, cloud computing, DevOps, and containerized environments.

### What is .bashrc?

A shell configuration file used to customize aliases, environment variables, and shell behavior.

### Difference between SCP and rsync?

SCP copies files every time, while rsync transfers only changed files, making it more efficient.

### What does chmod 755 mean?

Owner gets read, write, execute permissions. Group and others get read and execute permissions.

### What is systemd?

systemd is the service manager responsible for starting, stopping, and managing Linux services.

### How do you check memory usage?

```bash
free -h
top
htop
```
