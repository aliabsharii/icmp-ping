#!/bin/bash

clear
echo "====== ICMP Ping Manager ======"
echo "1) Disable Ping (Block ICMP)"
echo "2) Enable Ping (Allow ICMP)"
echo "3) Show Current Status"
echo "0) Exit"
echo "==============================="
read -p "Choose an option: " choice

case $choice in
1)
    sed -i '/net.ipv4.icmp_echo_ignore_all/d' /etc/sysctl.conf
    echo "net.ipv4.icmp_echo_ignore_all = 1" >> /etc/sysctl.conf
    sysctl -p
    echo "Ping has been DISABLED"
    ;;
2)
    sed -i '/net.ipv4.icmp_echo_ignore_all/d' /etc/sysctl.conf
    echo "net.ipv4.icmp_echo_ignore_all = 0" >> /etc/sysctl.conf
    sysctl -p
    echo "Ping has been ENABLED"
    ;;
3)
    sysctl net.ipv4.icmp_echo_ignore_all
    ;;
0)
    exit
    ;;
*)
    echo "Invalid option"
    ;;
esac
