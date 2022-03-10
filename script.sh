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
else echo "no chabges done"
fi
