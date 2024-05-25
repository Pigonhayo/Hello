
dir="$1"
echo "$dir"

file=$(ls -l | cut -c1 | grep -v d |wc -l)
folder=$(ls -l | cut -c1 | grep d | wc -l)
echo "현재 위치: $(pwd)"
echo "파일 "$file"개, 폴더 $folder개"

## $*
 - 모든 인수를 출력

 #전화번호부 관리 스크립트 만들기
  1) 검색
   ./bach.sh 이름
   ./
  2)
   이름, 번호를 인자로 넣어 추가
  3삭제
   이름으로 검색해서 이름, 번호 삭제
   