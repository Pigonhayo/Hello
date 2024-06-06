#!/bin/bash

PHONEBOOK="phonebook.txt"

# 인수 확인
if [ $# -ne 2 ]; then
    echo "Usage: $0 <name> <phone_number>"
    exit 1
fi

name=$1
number=$2

# 전화번호부 읽기 및 수정
found=false
tempfile=$(mktemp)

if [ -f "$PHONEBOOK" ]; then
    while read -r line; do
        entry_name=$(echo "$line" | cut -d' ' -f1)
        entry_number=$(echo "$line" | cut -d' ' -f2)
        entry_area=$(echo "$line" | cut -d' ' -f3)
        case $entry_area in
            "02") region="서울" ;;
            "051") region="부산" ;;
            "053") region="대구" ;;
            "032") region="인천" ;;
            "062") region="광주" ;;
            *) echo "Unknown area code: $entry_area"; exit 1 ;;
        esac

        if [ "$entry_name" = "$name" ]; then
            if [ "$entry_number" = "$number" ]; then
                echo "$name already has the same number."
                rm "$tempfile"
                exit 0
            else
                found=true
                continue
            fi
        fi
        echo "$entry_name $entry_number $entry_area" >> "$tempfile"
    done < "$PHONEBOOK"
fi

if [ "$found" = true ]; then
    echo "Updating $name's number."
else
    echo "Adding new entry for $name."
fi

echo "$name $number" >> "$tempfile"
sort "$tempfile" > "$PHONEBOOK"
rm "$tempfile"

echo "Added/Updated $name with number $number."
