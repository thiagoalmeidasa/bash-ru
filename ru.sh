#!/bin/bash

weekday=`date +%u`

case $weekday in
    1 ) begin="Segunda";end="Terça"
        ;;
    2 ) begin="Terça";end="Quarta"
        ;;
    3 ) begin="Quarta"; end="Quinta"
        ;;
    4 ) begin="Quinta"; end="Sexta"
        ;;
    5 ) begin="Sexta"; end=" "
        ;;
    * ) echo -n "O RU só funciona em dias de semana!"
        exit
        ;;
esac

function getcru () {
    curl -s 'http://ru.ufpa.br/index.php?option=com_content&view=article&id=7' | sed -e 's/<[^>]*>//g; s/[[^]]*]//g; s/  / /g; /^$/d;/^[[:space:]]*$/d;/Segunda/,/Card/! d; /'"$begin"'/,/'"$end"'/!d; /'"$end"'/d; s/^[ \t]*//  # s/ *-/Almoço\n/1; s/-/\n/2g;'
}

getcru ${begin} ${end}
