# open Xcode workspace/project 

function x() {
	xcode_workspace=`ls | grep "\.xcworkspace"`
	xcode_project=`ls | grep "\.xcproj"`
	version="default"
	
	if [[ $1 == "beta" ]]; then
		version="beta"
	fi
	
	if [[ `echo $xcode_workspace | wc -l` -eq 1 ]]; then
		xcode_open $version $xcode_workspace 
		return 0
	elif [[ `echo $xcode_workspace | wc -l` -ge 1  ]]; then
		echo "Choose workspace:"
		i=1
		for workspace in ${(@f)$(ls | grep "\.xc")}; do
			echo "$i. $workspace"
			i=i+1
		done
		return 0
	fi
	
	if [[ `echo $xcode_project | wc -l` == 1 ]]; then
		xcode_open $version $xcode_project 
		return 0
	elif [[ `echo $xcode_project | wc -l` > 1  ]]; then
		return 0
	fi
	
	echo "No Xcode workspace or project found"
}

# open Xcode workspace/project in Xcode beta
function xb() {
	x "beta"
}

function zzz() {
	echo "Going to sleep..." && pmset displaysleepnow
}

function ss() {
	/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine &> /dev/null
	/System/Library/CoreServices/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine &> /dev/null
}

function afk() {
	/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend && sleep 4 && pmset displaysleepnow
}

function xcode_open() {
	xcode='/Applications/Xcode.app'
	project=$2
	if [[ $1 = "b" || $1 = "beta" ]]; then
		xcode='/Applications/Xcode-beta.app'
	fi
	
	echo "Opening $project"
	open -a $xcode $project
}

function vsc() {
/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code $1
}

# open selected/current directory in Finder
function o() {
	if [[ $# -eq 0 ]]; then
		open .
	else
		open $*
	fi
}
