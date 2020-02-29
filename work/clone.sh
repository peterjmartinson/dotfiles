#!/bin/sh

# This script prepares a reporting project for local work
#
#   1. Create a shell .sql file with a standard header
#   2. Initialize a Git repository
#   3. Commit contents of the current folder to the Master branch
#   4. Clone the repository on the local machine
#
# This script is intended to be run *inside of* the main project folder on the team server
# Peter Martinson 2018

directory=${PWD##*/}
srnumber=`expr "$directory" : '\(^SR[0-9]*\)'`
name=`echo $directory | sed "s/SR[0-9]* - \(.*\) - .*/\1/"`
last_name=`echo $directory | sed "s/SR[0-9]* - .* \(\S*\) - .*/\1/"`
title=`echo $directory | sed "s/SR[0-9]* - .* - \(.*\)$/\1/"`
target_clone_directory='/c/Users/martinsp/Documents/Work/'$directory
file_name="${last_name}_${srnumber}.sql"

echo ""
echo "--------------------------------------------------------------------------------"
echo "Directory:     $directory"
echo "Ticket Number: $srnumber"
echo "Ticket:        $title"
echo "Requestor:     $name"
echo "Query:         $file_name"
echo "--------------------------------------------------------------------------------"
echo ""

echo '.*.swp' > ".gitignore"
echo '.ipynb_checkpoints' >> ".gitignore"
echo '~$*.xlsx' >> ".gitignore"

touch "$file_name"

# Add a header to the file
echo "/*" >> $file_name
echo " * Requester:   $name" >> $file_name
echo " * Ticket:      $srnumber" >> $file_name
echo " * Title:       $title" >> $file_name
echo " *" >> $file_name
echo " * Author:      Peter Martinson" >> $file_name
echo " * Open Date:   $date" >> $file_name
echo " * Close Date:  " >> $file_name
echo " *              " >> $file_name
echo "*/" >> $file_name
echo "" >> $file_name
echo "/*============================== DESCRIPTION ===================================" >> $file_name
echo "DAC Request [$srnumber] : $title" >> $file_name
echo "" >> $file_name
echo "" >> $file_name
echo "/*============================================================================*/" >> $file_name
echo "---" >> $file_name

git init
git add .
git commit -m 'Initial Commit'
git clone . "$target_clone_directory"


