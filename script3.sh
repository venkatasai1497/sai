#!/bin/bash
var=0
find . -name '*.py' > file2
while read -r line 
do autopep8 --in-place --exit-code --aggressive --aggressive "$line"
   if [ $? -eq 2 ] 
	then	var=1
		git add "$line"
   fi
done < file2
git status
#git status | grep ".py$" > file2
if  [ "$var" -eq 1 ]
then  rm file2
	git commit -m "autopep8 changes done"
	git push "https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/gitchanges.git" HEAD:main
else	rm file2
	echo "no autopep8 changes"
fi
