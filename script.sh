#!/bin/bash
find . -name '*.py' > file.txt
cat file.txt
while read -r line
do autopep8 --in-place --aggressive --aggressive "$line"
done < file.txt


git add .
git status | grep ".py$" > file.txt
cat file.txt
if [ -s file.txt ]
then  rm file.txt
      git add .
      git commit -am "commit the changed.py file"
      git push "https://venkatasai1497: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@github.com/venkatasai1497/sai.git"
      git init
else echo "no chabges done"
fi
