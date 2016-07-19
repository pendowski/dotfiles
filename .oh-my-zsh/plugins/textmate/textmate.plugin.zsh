alias et='mate .'
alias ett='mate Gemfile app config features lib db public spec test Rakefile Capfile Todo'
alias etp='mate app config lib db public spec test vendor/plugins vendor/gems Rakefile Capfile Todo'
alias etts='mate app config lib db public script spec test vendor/plugins vendor/gems Rakefile Capfile Todo'

# Edit Ruby app in TextMate
alias mr='mate CHANGELOG app config db lib public script spec test'

# If the tm command is called without an argument, open TextMate in the current directory
# If tm is passed a directory, cd to it and open it in TextMate
# If tm is passed anything else (i.e., a list of files and/or options), pass them all along
#    This allows easy opening of multiple files.
function tm() {
	if [[ -z $1 ]]; then
		mate .
	elif [[ -d $1 ]]; then
		mate $1
		cd $1
	else
		mate "$@"
	fi
}
