clipboard=/tmp/myClipboard              #Clipboard location

function ccopy {						#Copy files to clipboard 
	if [ -d $clipboard ]; then
		rm -rf $clipboard/{,.[!.],..?}*
	else
		mkdir $clipboard
	fi
	cp -r $@ $clipboard
	echo "Files copied: "
	ls -A $clipboard
}

function ccut {							#Cut files to clipboard
	if [ -d $clipboard ]; then
		rm -rf $clipboard/{,.[!.],..?}*
	else
		mkdir $clipboard
	fi
	cp -r $@ $clipboard
	echo "Files cut: "
	ls -A $clipboard
	if [ -e $clipboard/$@ ]; then
		rm -rf $@
	fi
}

function cpaste {						#Paste files from clipboard
	if [ -d $clipboard ] &&  [ ! -z "$(ls -A $clipboard)" ]
	then
		cp -r $clipboard/. .
		echo "Files pasted: "
		ls -A $clipboard
	else
		echo "Clipboard is empty"
	fi
}

function cclear {						#Clear clipboard
	if [ -d $clipboard ]; then
		rm -rf $clipboard/{,.[!.],..?}*
	fi
	echo "Done"
}

function cshow {					#Show clipboard
	ls -A $clipboard
}

function makelatex {
	if [ $# -eq 0 ]; then
		fileName="default"
	else
		fileName=$1
	fi
	if [ -f $driveLocation/Documents/LatexTemplate.tex ]; then
		cp $driveLocation/Documents/LatexTemplate.tex ./$fileName.tex
		if [ $? -eq 0 ]; then
			echo "$fileName.tex was created"
		fi
	else 
		echo "Error: Latex template is not found"
	fi
}
