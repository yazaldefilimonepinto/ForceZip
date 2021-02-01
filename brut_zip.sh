#!/bin/bash

if [ "$1" == "" -o "$2" == "" ]; then
	echo "[×]Yazalde[×] $0 <arquivo> <wordlist>";
    	exit 1;
fi 
FILE=$1
WORDLIST=$2
if [ ! -e "$FILE" ]; then
	echo "[×]Yazalde[×]==>> o <$FILE> Nao consegue encotrar!";
        exit 1;
fi
    
if [ ! -e "$WORDLIST" ]; then
    	echo "[×]Yazalde[×]==>> o <$WORDLIST> Nao consegue encotrar!";
    	exit 1;
fi
for PASS in $(cat $WORDLIST); do
	CMD=$(7z t $FILE -p$PASS 2>&1 | grep "password")
    if [ "$CMD" == "" ]; then
	    echo "[✓]Yazalde[✓]===> parabens a usua wordlist deu serto! a senha e: $PASS";
	    exit 0;
 fi
done


