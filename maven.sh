#!/bin/bash
mvn -version > file.txt
cat file.txt
if [ -s file.txt ]
then echo "maven instaleed"
else sudo apt-get update
     sudo apt-get install maven -y
     mvn --version
fi

