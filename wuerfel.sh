#!/bin/bash

genpasswd() {
	local l=$1
       	[ "$l" == "" ] && l=8
      	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}


len=8

if [ "$1" != "1" ]
then 
  len=$1
fi 
genpasswd $len

