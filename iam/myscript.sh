#!/bin/env bash
IFS=';'
OLDIFS=$IFS
LINHAS=$(wc -l < $1)
LINHAS=$(($LINHAS-1))
COUNT=0

while read -r name email password user group policy; do
    if [ "$user" != "User" ]; then
       COUNT=$(($COUNT+1))
        
       echo "*******************************************************************************************"
       echo "*******************************************************************************************"
       echo "**********       ********    **************     **************    *******                **"
       echo "*********    *    ********    ************   *   ************    ********    **************"
       echo "********    ***    ********    **********   ***   **********    *********    **************"
       echo "*******    *****    ********    ********   *****   ********    **********    **************"
       echo "******               ********    ******   *******   ******    ***********                **"
       echo "*****    *********    ********    ****   *********   ****    ************************    **"
       echo "****    ***********    ********    **   ***********   **    *************************    **"
       echo "***    *************    ********       *************       **************************    **"
       echo "**    ***************    ********     ***************     ***************                **"
       echo "*******************************************************************************************"
       echo "*******************************************************************************************"

       echo "User account info process: $name"
       echo "Process $COUNT of $LINHAS"

       aws iam create-user --user-name $user
       aws iam create-login-profile --password-reset-required --user-name $user --password $password
       aws iam add-user-to-group --group-name $group --user-name $user
       aws iam attach-user-policy --policy-arn arn:aws:iam::226468448248:policy/EnforceMFAPolicy --user-name $user
       clear
    fi
done < "$1"

echo "---------------------------------------"
echo "The script was executed successfully :)"
echo "---------------------------------------"
