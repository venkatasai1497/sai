#!/bin/bash
#apt-get install python-autopep8
find . -name '*.py' > file.txt
#cat file.txt
while read -r line
do autopep8 --in-place --aggressive --aggressive "$line"
done < file.txt
 ######
git status | grep ".py$" > file.txt
cat file.txt
if [ -s file.txt ]
then   rm file.txt
	git add .
        git commit -am "Commit done"
        git config user.email "venkata.sai1497@gmail.com"
        git config user.name "venkatasai1497"
        git push "https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/venkatasai1497/gitchanges.git"
else  echo "no changes done"
fi
