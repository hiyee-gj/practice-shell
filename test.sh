#! /bin/sh

# 여기는 코멘트이다.
# 코멘트 처리된 구문은 실행되지 않는다.

# ehco로 출력, read로 입력할 수 있다.
# read NAME # 입력을 대기한다. 대기하고 있는 경우, 스크립트는 실행되지 않는다.
# echo "Hello, $NAME"

NAME="hiyee-gj"
# Bash에서는 -e 플래그로 특수 텍스트를 이스케이프할 수 있다.
echo "Hello\n$NAME!" # 개행된다.

# 변수의 이름으로써 영문자, 숫자 그리고 언더바가 사용된다.
# 변수에 값을 전달할 때는 = 의 앞, 뒤에 공백 없이 작성한다. 문자열인 경우 ""로 감싼다.
var="변수1"
VaR_2="변수2"

# 변수에 엑세스할 때 변수명의 앞에 $를 넣는다. 혹은 $넣고 변수를 {}로 감싼다.
# 하나의 변수에 한 개의 값만 보존된다.
echo "Var_2=$VaR_2"

# 변수의 값이 덮어 쓰기되는 것을 방지하기 위해서는 readonly를 사용한다.
# 변수를 unset으로 삭제할 수 있다. 그러나 readonly 변수를 삭제하는 것은 불가능하다.
readonly var
# var="readonly var를 바꿔보자"

# 특별한 변수
# 쉘 스크립트에서는 아래와 같은 특별한 변수가 있다.

# $0 : 스크립트 명
# $1 ~ $9: 인수, 첫 번째의 인수는 $1, 2번 째의 인수는 $2로 엑세스한다.
# $# : 스크립트에 전달된 인수의 수
# $* : 모든 인수를 모아서 하나로 ㅓ리
# $@ : 모든 인수를 각각 처리
# $? : 직전에 실행한 커맨드의 종료 값(0은 성공, 1은 실패)
# $$ : 이 쉘 스크립트의 프로세스 ID
# $! : 마지막으로 실행한 백그라운드 프로세스 ID

# 특수문자는 문자열로 사용할 때는 앞에 \를 쓴다.
echo "\$0（스크립트 명）: $0"
echo "\$1（1번째 인수）: $1" 
echo "\$2（2번째 인수）: $2" 
echo "\$#（인수의 수）: $#" 
echo "\"\$*\": \"$*\"" 
echo "\"\$@\": \"$@\"" VAR="exit값은0이 될 것이다." 
echo $?

# 변수 값의 치환

# ${var} : 변수 값을 바꿔 넣는다.
# ${var:-word} : 변수가 아직 세팅되지 않거나 공백 문자열의 경우 word를 반환한다. var에는 저장되지 않는다.(default 값)
# ${var:=word} : 변수가 아직 세팅되지 않거나 공백 문자열의 경우 word를 반환한다. var에 저장된다.(default 값을 저장함)
# ${var:?word} : 변수가 아직 세팅되지 않거나 공백 문자열의 경우 치환에 실패하고, 스탠다드 에러에 에러가 표시된다.
# ${var:+word} : 변수가 세팅되지 않은 경우 word가 반환된다. var에는 저장되지 않는다.

echo "1 - ${test:-TestWord1}"
echo "2 - test = ${test}"
echo "3 - ${test:=TestWord3}"
echo "4 - test = ${test}"
unset test
echo "5 - ${test:+TestWord5}"
echo "6 - test = ${test}"
test="new Value"
echo "7 - ${var:+TestWord7}"
echo "8 - test = ${test}"
echo "9 - ${test:?ErrorMessage}"
echo "10 - test = ${test}"