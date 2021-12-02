#!/bin/env bash
IFS=';'
OLDIFS=$IFS
while read -r name email password user group policy; do
   echo $group
done < "$1"
