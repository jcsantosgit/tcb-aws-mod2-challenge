#!/bin/env bash
IFS=';'
OLDIFS=$IFS
while read -r name email password user group policy; do
    if [ "$user" != "User" ]; then
       echo "$user | $password | $group | $policy"
    fi
done < "$1"
