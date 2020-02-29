echo "reports    -> /i/Athena/Report Requests/martinson/"
echo "work       -> Launch Vim in /Work"
echo "local      -> /c/Users/martinsp/Documents/Work"
echo "transplant -> /i/Transplant - Datawarehouse Team/"
echo "documents  -> /c/Users/martinsp/Documents/"
echo "code       -> /c/Users/martinsp/Documents/code/"
# echo "test       -> /c/Users/martinsp/Code/Work/Geocode Testing"
echo "cheatsheet -> print a list of useful commands"
echo "snip       -> edit the Vim snippet list"

alias reports='cd /i/Athena/Report\ Requests/martinson/'
alias local='cd /c/Users/martinsp/Documents/Work'
alias code='cd /c/Users/martinsp/Documents/code'
alias documents='cd /c/Users/martinsp/Documents'
alias transplant='cd /i/Transplant\ -\ Datawarehouse\ Team/'
alias txp="transplant"
# alias test='cd /c/Users/martinsp/Code/Work/Geocode\ Testing'
alias sql='sqlplus REPORTS_ADMIN/Ad4ReportDb@"(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DACDatabasePDSProd)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=pdsprd.uphs.upenn.edu)))"'
alias pdsuid='sqlplus REPORTS_ADMIN/Ad4ReportDb@"(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=DACDatabasePDSUid)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=pdsuid.uphs.upenn.edu)))"'
alias snip='vim ~/.vim/after/snippets/_.snippets'
alias clone='/i/Athena/Report\ Requests/martinson/clone.sh'
alias ssh-ds='ssh uphsvlndc121.uphs.upenn.edu'

work() {
  cd /c/Users/martinsp/Documents/Work
  vim -c Explore
}

alias ll='ls -l'
alias la='ls -a'
alias lsort='ls -lt'

alias tree="find . -print | sed -e '/^\.$/d' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

alias cs="cheatsheet"
alias python="winpty /c/Users/martinsp/AppData/Local/Continuum/anaconda3/python.exe"
alias conda="winpty /c/Users/martinsp/AppData/Local/Continuum/anaconda3/Scripts/conda.exe"
alias mocha="mocha --colors"
alias javac='/c/Program\ Files/Java/jdk-9.0.1/bin/javac'

PATH=$PATH:/c/Users/martinsp/AppData/Local/Continuum/anaconda3/Scripts

alias snip="vim .vim/after/snippets/_.snippets"

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
}
