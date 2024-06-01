month=$1
day=$2
year=$3

if [ ! $# = 3 ]
then echo "오류"
exit 1
fi

case "$month" in

  jan | january | 1)
  month="Jan" ;;
  feb | february | 2)
  month="Feb" ;;
  mar | march | 3)
  month="Mar" ;;
  apr | april | 4)
  month="Apr" ;;
  may | 5)
  month="May" ;;
  jun | june | 6)
  month="Jun" ;;
  jul | july | 7)
  month="Jul" ;;
  aug | august | 8)
  month="Aug" ;;
  sep | september | 9)
  month="Sep" ;;
  oct | october | 10)
  month="Oct" ;;
  nov | november | 11)
  month="Nov" ;;
  dec | december | 12)
  month="Dec" ;;
esac

if [ $((year % 4)) -eq 0 ] && [ $((year % 100)) -ne 0 ] || [ $((year % 400)) -eq 0 ]
then
leap_year=true

else
leap_year=false
fi



case "$month" in
    "Jan"|"Mar"|"May"|"Jul"|"Aug"|"Oct"|"Dec")
        days_in_month=31
        ;;
    "Apr"|"Jun"|"Sep"|"Nov")
        days_in_month=30
        ;;
    "Feb")
        if [ "$leap_year" = true ]; then
            days_in_month=29
        else
            days_in_month=28
        fi
        ;;

esac

# 입력 날짜가 유효한지 확인
if [ "$date" -le 0 ] || [ "$date" -gt "$days_in_month" ]; then
  if [ "$month" = "Feb" ]
    then echo "$year의 2월달은 1일부터 $days_in_month일까지 존재하므로 $month $date $year는 유효하지 않습니다."
    exit 0
  else
    echo "옳지 않은 날짜이므로 $month $date $year는 유효하지 않습니다."
    exit 1
  fi  
fi

# 유효한 날짜 출력
echo "$month $date $year"