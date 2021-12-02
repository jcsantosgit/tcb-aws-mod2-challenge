#!/bin/env bash
# aws iam attach-user-policy --policy-arn arn:aws:iam::226468448248:policy/EnforceMFAPolicy --user-name jcsantosgit
IFS=';'
OLDIFS=$IFS
while read -r name email password user group policy; do
    if [ "$user" != "User" ]; then
       echo "$user | $password | $group | $policy"
    fi
done < "$1"
