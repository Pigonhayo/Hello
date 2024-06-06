count=15
a=1

if [ "$count" -gt 0 ] && [ $count -lt 10 ]
  then
  echo 0~10 사이
else
  exit 0
fi

case $a
in
  1) echo "a의 값은 1입니다." ;;
  2) echo "a의 값은 2입니다." ;;
  3) echo "a의 값은 3입니다." ;;
  4) echo "a의 값은 4입니다." ;;
esac

