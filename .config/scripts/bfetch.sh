#!/usr/bin/env bash

ker_ver=$(uname -r)
host=$(hostname)
machine=$(hostnamectl | grep "Hardware Model" | awk '{print $3,$4}')
os_ver=$(hostnamectl | grep "Operating System" | awk '{print $3,$4,$5,$6}')
uptime=$(uptime -p)
num_pack=$(dpkg --get-selections | grep -v deinstall | wc -l)
shell=$(basename $SHELL)
shell_ver=$($shell --version | awk '{$0,$1}'

out="
$host@$USER
-----------
OS: $os_ver
Kernel: $ker_ver
Uptime: $uptime
Packages: $num_pack (dpkg)
Shell: 
"
echo "$out"
