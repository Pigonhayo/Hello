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
    while read -r entry_name entry_number entry_area; do
        case $entry_area in
            서울)
                code_number="02"
                ;;
            부산)
                code_number="051"
                ;;
            대구)
                code_number="053"
                ;;
            인천)
                code_number="032"
                ;;
            광주)
                code_number="062"
                ;;
            *)
                echo "Unknown area code: $entry_area"
                exit 1
                ;;
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









