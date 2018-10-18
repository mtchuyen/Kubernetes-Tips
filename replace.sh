#!/bin/bash
#set -x

DIRECTORY=`pwd | sed 's,^\(.*/\)\?\([^/]*\),\2,'`
echo $DIRECTORY
CURRDIR="devops"
if [ $DIRECTORY == "devops" ]; then
	echo "You are in devops directory"
	CURRDIR="."
fi
echo "current directory: $CURRDIR"

usage() {
    echo "bash replace (replace | runscript | help)"
	echo "example:"
	echo "bash replace runscript improc"
	echo "     --> for run script *-InAll.sh in all folder improc-*"
}

replace(){
	op="$1"
	if [ $op != "YES" ]; then
		echo "Not replace string"
		return 0
	else
		echo "Start search file and replace string"
	fi

	#old_val='"192.168.23.225:3801", "192.168.23.59:3801"'
	#new_val='"192.168.23.59:3801"'
	#array directories = find('devops', 'rt');
	#foreach (string directory in directories)
	#{}
	#for dir in "devops/rt-*/" -maxdepth 1 -name '*.properties'
	for dir in "$CURRDIR/"
	do

		echo $dir

		for pp in $(grep -Rl "ir.admicro.vn" $dir)
		do
			echo $pp
			#sed -i 's#"192.168.23.225:3801", "192.168.23.59:3801"#"192.168.23.59:3801"#g' "${pp}"
			#sed -i 's#"192.168.23.59:3801"#"192.168.23.225:3801", "192.168.23.59:3801"#g' "${pp}"
			#sed -i 's#"192.168.23.225:3801", "192.168.23.59:3801"#"192.168.23.225:3801"#g' "${pp}"
		done
	done
	return 1
}
runOneScript(){
	dir="$1"
	npath="$CURRDIR/$dir"
	nscrp="$dir-InAll.sh"
	echo "$npath"
	echo "$nscrp"
	if [ -d "$npath" ]; then
		if [ ! -f "$npath/$nscrp" ]
		then 
			echo "File $nscrp not exist in folder $npath"
			return 0
		fi
		echo "$nscrp"
		cd "$npath" && bash "$nscrp" #&& pwd && cd .. && pwd
		return 1
	else
		echo "Folder $npath not exist"
		return 0
	fi
	return 1
}
runScript(){
	op="$1"
	base="$CURRDIR"
	if [[ $op == "rt" || $op == "realtime" ]]; then
		subdir="$base/rt-*"
	elif [[ $op == "improc" ]]; then
		subdir="$base/improc-*"
	else
		echo "Start search file and running script: $op"
		runOneScript "$op"
		return 1
	fi

	if [[ $subdir != $base ]]; then
		echo "Start to run all script *-InAll.sh"
		#basedir="$CURRDIR/rt-*"
		echo $subdir
		for dirs in $subdir
		do
			if [[ -d $dirs ]]; then
				#echo $dirs
				fder=`/usr/bin/basename $dirs`
				#echo $(dirname $dirs)
				#echo $fder
				res2=$(runOneScript "$fder")
				echo "$res2"
			fi
		done
	fi
	return 1
}

if [[ "$#" -gt 2 ]]; then
    echo "replace takes 1 or 2 arg(s)"
    usage
elif [[ "$#" -eq 2  ]]; then
    case "$1" in
        'replace')
            replace "$2"
            ;;
        'runscript')
            runScript "$2"
            ;;
        *)
            usage
            ;;
    esac
elif [[ "$#" -eq 1 ]]; then
    case "$1" in
		'replace')
				echo 'modify string need to replace, then run with option "YES"'
				;;
		'runscript')
				echo 'modify string need to replace, then run with option "ALL"'
				;;
        *)
            usage
            ;;

	esac
elif [[ "$#" -eq 0 ]]; then
	echo "nothing"
	usage
    #for i in "${!conf_dirs[@]}"; do
    #    status "$i"
    #done
fi
