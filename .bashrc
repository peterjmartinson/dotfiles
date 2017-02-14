echo "cheatsheet -> print a list of useful commands (EXPERIMENTAL!)"
echo "code       -> /c/Users/martinsp/Code/"
echo "documents  -> /c/Users/martinsp/Documents/"
echo "report     -> /i/Athena/Report Requests/martinson/"
echo "txp        -> /i/Transplant - Datawarehouse Team/"

alias report='cd /i/Athena/Report\ Requests/martinson/'
alias code='cd /c/Users/martinsp/Code'
alias documents='cd /c/Users/martinsp/Documents'
alias txp='cd /i/Transplant\ -\ Datawarehouse\ Team/'
alias sql='sqlplus REPORTS_ADMIN/Ad4ReportDb@"(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DACDatabasePDSProd)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=pdsprd.uphs.upenn.edu)))"'

alias ll='ls -l'
alias la='ls -a'
alias lsort='ls -lt'

alias tree="find . -print | sed -e '/^\.$/d' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias comma="sed -i 's/ *, */,/g' *"
alias white="sed -i 's/^ *//g' *"

alias cs="cheatsheet"
alias python="winpty python.exe"

# removes whitespace around commas and at beginnings of lines
# used for dirty .csv files created by SQL*Plus
trimcsv () {
  sed -i 's/ *, */,/g' *.csv;
  sed -i 's/^ *//g' *.csv;
}

# removes whitespace around bars | and at beginnings of lines
# used for dirty .csv files created by SQL*Plus
trimbar () {
  sed -i 's/ *| */|/g' *.csv;
  sed -i 's/^ *//g' *.csv;
  sed -i '$d' *.csv;
}

# Creates a checklist.txt for all files in a directory
#
#   [ ] Item 1
#   [ ] Item 2
#
checklist () {
  ls | sed 's/^/\[ \] /' > checklist.txt;
  sed -i '/checklist/d' checklist.txt;
}

cheatsheet () {
  echo "=======";
  echo "= sed =";
  echo "=======";
  echo "";
  echo "Change first line of every file in a folder to ALL CAPS:";
  echo "$ sed -i '1s/\(.*\)/\U\1/' *";
  echo "";
  echo "Quote all entries in a .csv file:";
  echo "$ sed -i 's/,/\\\",\\\"/g' test.csv";
  echo "$ sed -i 's/^/\\\"/' test.csv";
  echo "$ sed -i 's/\([0-9a-zA-Z\)$/\1\\\"/' test.csv";
  echo "";
  echo "Remove last line of every file:";
  echo "$ sed -i '\$d' *.csv";
  echo "";
  echo "Trim spaces from a .csv file:";
  echo "$ sed -i 's/ *, */,/g' *.csv";
  echo "$ sed -i 's/^ *//g' *.csv";
  echo "";
  echo "========";
  echo "= grep =";
  echo "========";
  echo "";
  echo "Find all files in <dir> with string <str>:";
  echo "$ grep -r \"<str>\" <dir>";
  echo "";
  echo "Include 3 lines Before and 2 lines After the match:";
  echo "$ grep -r -B 3 -A 2 \"<str>\" <dir>";
  echo "";
  echo "Only print the file names, sorted with duplicates removed:";
  echo "(note, \$1 refers to everything up to the first colon)";
  echo "$ grep -r \"<str>\" <dir> | awk -F: '{print \$1}' | sort -u";
  echo "";
  echo "Print the file names and line numbers, sorted with duplicates removed:";
  echo "$ grep -r \"<str>\" <dir> | awk -F: '{print \$1, \": line\", \$2}' | sort -u";
  echo "";
  echo "=======";
  echo "= Vim =";
  echo "=======";
  echo "";
  echo "File Manipulation via Command Line:";
  echo "<Ctrl-z> : Pushes Vim into the background";
  echo "$ fg     : Brings Vim back up where you left off";
}
