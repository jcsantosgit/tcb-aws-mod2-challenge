FILE=$1
LINHAS=$(wc -l < $FILE)
LINHAS=$(($LINHAS-1))
COUNT=0
while read -r name; do
   COUNT=$(($COUNT+1))
   echo "Processando $COUNT de $LINHAS"
done < $FILE
