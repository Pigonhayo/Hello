#!/bin/bash

# 파일 경로
PHONEBOOK="phonebook.txt"

# 입력 파라미터 확인
if [ "$#" -ne 2 ]; then
    echo "인수를 2개만 입력해주세요."
    exit 1
fi

# 변수에 입력값 할당
name="$1"
number="$2"

# 번호가 숫자인지 확인
if ! [[ "$number" =~ ^[0-9-]+$ ]]; then # =~ 연산자는 문자열이 정규 표현식과 일치하는지 확인할 때 사용함
    echo "옳지 않은 전화번호입니다."
    exit 1
fi

# 지역번호 구현
area_code=$(echo "$number" | cut -d'-' -f1 )
case $area_code in
    "02") area="서울" ;;
    "051") area="부산" ;;
    "053") area="대구" ;;
    "032") area="인천" ;;
    "062") area="광주" ;;
    "055") area="경남" ;;
    *) echo "존재하지 않는 지역번호입니다." ; exit 1 ;; # 여기서 *은 default와 같이 동작 
esac

# 전화번호부 검색 및 수정
if [ -f "$PHONEBOOK" ]; then
    while read -r line; do
        entry_name=$(echo "$line" | cut -d' ' -f1)
        entry_number=$(echo "$line" | cut -d' ' -f2)
        entry_area=$(echo "$line" | cut -d' ' -f3)
        if [ "$entry_name" = "$name" ]; then
            if [ "$entry_number" = "$number" ]; then
                echo "$name은 이미 존재하는 이름입니다."
                exit 0
            else
                echo "$name의 전화번호를 업데이트합니다."
                sed -i "/^$name/d" "$PHONEBOOK" # $name과 일치하는 줄을 $PHONEBOOK 파일에서 삭제
                echo "$name $number $area" >> "$PHONEBOOK"
                sort -o "$PHONEBOOK" "$PHONEBOOK"  # 파일을 번호순으로 정렬
                exit 0
            fi
        fi
    done < "$PHONEBOOK"
fi

# 새로운 항목 추가
echo "$name으로 새로운 항목을 추가합니다."
echo "$name $number $area" >> "$PHONEBOOK" # >>는 출력 리다이렉션 연산자로, 기존 파일에 내용을 추가(append)할 때 사용
sort -o "$PHONEBOOK" "$PHONEBOOK" # 파일을 번호순으로 정렬
exit 0




