#!/bin/bash
mkdir bin/ 2> /dev/null
files=""
for file in `ls ./src`; do
    if [[ $file =~ Test ]]; then
	: #NO-OP
    else
        files=$files" ./src/"$file
    fi
done
javac -cp "./bin/:rsyntaxtextarea-2.5.8.jar:./autocomplete-2.5.8.jar" -sourcepath "rsyntaxtextarea-2.5.8.jar:autocomplete-2.5.8.jar" -d ./bin $files
java -cp "./rsyntaxtextarea-2.5.8.jar:./autocomplete-2.5.8.jar:./bin/" VD
