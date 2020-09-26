alias myip='echo $(wget -qO - https://api.ipify.org)'
alias off="poweroff"
#alias reboot="reboot -f"
alias date="date -Is"
alias open='xdg-open &>/dev/null'
alias cam='droidcam &>/dev/null'
alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bashrc'
alias bal='vim ~/.bash_aliases'

if uname -r | grep microsoft &> /dev/null; then
	userDir=''
	if [ -d /mnt/c/Users/bmasd/ ]; then
		userDir='bmasd'
	else
		if [ -d /mnt/c/Users/BM/ ]; then
			userDir='BM'
		fi
	fi
	if [ userDir != '' ]; then
		driveLocation="/mnt/c/Users/$userDir/OneDrive"
	else 
		echo "Windows user folder not found"
	fi
else
	driveLocation="~/OneDrive"
fi

alias drive="cd $driveLocation"
alias doc="cd $driveLocation/Documents/"
alias doc2="cd $driveLocation/Documents/2-SecondYear"
alias cs="cd $driveLocation/Documents/ComputerScience"
alias ps="cd $driveLocation/Personal\ Info"
alias jp="cd $driveLocation/Documents/Japanese"


alias gl="git log --graph --oneline --decorate"
alias gs="git status"
alias ga="git add"
alias gm="git commit -m"
alias gpush="git push origin"
alias gpull="git pull origin"


alias syncon="insync start"
alias syncoff="insync quit"
