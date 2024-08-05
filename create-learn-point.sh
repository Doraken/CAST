#!/bin/bash 
# author : Arnaud Crampet 
# Date : 28/06/2024
# generic azure ressource group managment from CAST
#|# force defaul sourcing as null vars
resultat=Learning.xml
File_list=$( find ./ -type f | egrep -v \.git | egrep -v ${resultat} | egrep -v \.md | egrep -v \LICENSE )



#|# Read file content and protect all needed caracters 
function do_char_protect () 
{
    #|# file to read
    local file="$1"

    #|# read and protecte
    cat "${file}" | sed -e 's/\&/\&amp;/g' \
                           -e 's/</\&lt;/g' \
                           -e 's/>/\&gt;/g' \
                           -e 's/"/\&quot;/g' \
                           -e "s/'/\&apos;/g" \
                           -e 's/é/e/g' \
                           -e 's/è/e/g' \
                           -e 's/ê/e/g' \
                           -e 's/ë/e/g' \
                           -e 's/à/a/g' \
                           -e 's/â/a/g' \
                           -e 's/ä/a/g' \
                           -e 's/ç/c/g' \
                           -e 's/î/i/g' \
                           -e 's/ï/i/g' \
                           -e 's/ô/o/g' \
                           -e 's/ö/o/g' \
                           -e 's/ù/u/g' \
                           -e 's/û/u/g' \
                           -e 's/ü/u/g' \
                           -e 's/É/E/g' \
                           -e 's/È/E/g' \
                           -e 's/Ê/E/g' \
                           -e 's/Ë/E/g' \
                           -e 's/À/A/g' \
                           -e 's/Â/A/g' \
                           -e 's/Ä/A/g' \
                           -e 's/Ç/C/g' \
                           -e 's/Î/I/g' \
                           -e 's/Ï/I/g' \
                           -e 's/Ô/O/g' \
                           -e 's/Ö/O/g' \
                           -e 's/Ù/U/g' \
                           -e 's/Û/U/g' \
                           -e 's/Ü/U/g' \
                           -e 's/œ/oe/g' \
                           -e 's/Œ/OE/g' \
                           -e 's/æ/ae/g' \
                           -e 's/Æ/AE/g' \
                           -e 's/ñ/n/g' \
                           -e 's/Ñ/N/g'
}


function do_line_managment () 
{
    #|# read cat output line by line
    ligne_numero=1
    while IFS= read -r ligne 
    do 
        echo "<fileline lineNumber=\"${ligne_numero}\">${ligne}</fileline>"
        ((ligne_numero++))
    done
}
 
function main()
{
echo "<root>" 
for file in ${File_list} 
  do 
     echo "     <file>"
     echo "         <filename>${file}</filename>" 
     echo "              <content>"
     do_char_protect "${file}" | do_line_managment
     echo "              </content>"
     echo "     </file>"
done 
echo "</root>"
}

main > ${resultat}