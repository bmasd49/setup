alias myip='echo $(wget -qO - https://api.ipify.org)'
alias off="poweroff"
alias date="date -Is"
alias open='xdg-open &>/dev/null'
alias cam='droidcam &>/dev/null'
alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bashrc'
alias zrc='vim ~/.zshrc'
alias prc='vim ~/.p10k.zsh'
alias bal='vim ~/.bash_aliases'
alias src='source ~/.profile'
alias updateall='sudo apt update && sudo apt upgrade'
alias theme='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
alias sysinfo='neofetch'


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
	driveLocation="$HOME/OneDrive"
fi

alias drive="cd $driveLocation"
alias doc="cd $driveLocation/Documents/"
alias doc2="cd $driveLocation/Documents/2-SecondYear"
alias doc3="cd $driveLocation/Documents/3-ThirdYear"
alias cs="cd $driveLocation/Documents/ComputerScience"
alias ps="cd $driveLocation/Personal\ Info"
alias jp="cd $driveLocation/Documents/Japanese"
alias sat="cd $driveLocation/Documents/ComputerScience/findsatbyrf/findsat"
alias mul="cd /mnt/d/Multimedias/"


alias gl="git log --graph --oneline --decorate"
alias gs="git status"
alias ga="git add"
alias gaa="git add -all"
alias gm="git commit -m"
alias gpush="git push origin"
alias gpull="git pull origin"
alias gseturl='git remote set-url origin git@github.com:'


alias syncon="insync start"
alias syncoff="insync quit"
