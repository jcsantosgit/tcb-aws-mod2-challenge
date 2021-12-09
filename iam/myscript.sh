#!/bin/env bash
# aws iam attach-user-policy --policy-arn arn:aws:iam::226468448248:policy/EnforceMFAPolicy --user-name jcsantosgit
IFS=';'
OLDIFS=$IFS

echo "Processing..."

while read -r name email password user group policy; do
    if [ "$user" != "User" ]; then
       aws iam create-user --user-name $user
       aws iam create-login-profile --password-reset-required --user-name $user --password $password
       aws iam add-user-to-group --group-name $group --user-name $user
       aws iam attach-user-policy --policy-arn arn:aws:iam::226468448248:policy/EnforceMFAPolicy --user-name $user
       echo "-------------------------------------------------------------------------------------------------------------------------------------"
    fi
done < "$1"

echo "The script was executed successfully :)"
