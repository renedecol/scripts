#!/bin/bash


def=$(routel | grep default | awk  '{print $2}')

a1=$(echo $def | awk -F'.' '{print $1}')
a2=$(echo $def | awk -F'.' '{print $2}')
a3=$(echo $def | awk -F'.' '{print $3}')
a4=$(echo $def | awk -F'.' '{print $4}')


args=("$@")
cmd=${args[0]}

case $cmd in
  m)
    echo more
    sudo nmap 192.168.0.0/24 | grep -v latency | grep -v closed | grep -v SERVICE | grep -v adresses
    ;;

  h)
    echo options
    echo void : easy scan
    echo m: some more informations
    echo h: this help 
    ;;

  *)
    echo execute easy
    nmap -sP ${a1}.${a2}.${a3}.0/24 | grep -v scanned |  grep scan | awk '{print $6}'
    ;;
esac


