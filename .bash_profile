echo "report    -> /i/Athena/Report Requests/martinson/"
echo "code      -> /c/Users/martinsp/Code/"
echo "documents -> /c/Users/martinsp/Documents/"

alias report='cd /i/Athena/Report\ Requests/martinson/'
alias code='cd /c/Users/martinsp/Code'
alias documents='cd /c/Users/martinsp/Documents'
alias sql='sqlplus REPORTS_ADMIN/Ad4ReportDb@PDSPRD'

alias ll='ls -l'
alias la='ls -a'
alias lsort='ls -lt'

alias tree="find . -print | sed -e '/^\.$/d' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias comma="sed -i 's/ *, */,/g' *"
alias white="sed -i 's/^ *//g' *"

# removes whitespace around commas and at beginning of line
# used for dirty .csv files created by SQL*Plus
stripwhite () { sed -i 's/ *, */,/g' $1; sed -i 's/^ *//g' $1; }
