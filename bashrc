#-----------------------------------------
# 个人Linux .bashrc 快捷配置
# http://www.beginman.cn
# BeginMan
#-----------------------------------------
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# Fcitx 
export XMODIFIERS="@im=fcitx"

# My alias 
alias cls='clear'    # 清屏
alias pyrun='python manage.py runserver' #启动python脚本
alias gs='git push origin master'  # 简化
alias gl='git pull origin master'  # 简化
alias gld='git pull origin develop'
alias gsd='git push origin develop:develop'
alias pro='cd ~/project/'
alias py='python'
alias crt='SecureCRT'
export PS1='[\u@\h \W]\$ '
alias rfcitx='fcitx -r --enable fcitx-qimpanel ' # restart Fcitx
alias sfcitx='fcitx-qimpanel' # open it
alias pyteacher='cd ~/project/tbkt_teacher/;sudo python manage.py runserver 127.0.0.1:807'
# 七牛云存储设置
alias qnlogin='/home/beginman/qiniu/qboxrsctl login xinxinyu2011@163.com fang1991' # 登录
alias qninfo='/home/beginman/qiniu/qboxrsctl info' # 查看帐号信息
alias qnkey='/home/beginman/qiniu/qboxrsctl newaccess ' # 生成密钥 后面要输入appname名称
alias qnappinfo='/home/beginman/qiniu/qboxrsctl appinfo ' #查看密钥 后面要输入appname名称
alias qndelkey='/home/beginman/qiniu/qboxrsctl delaccess ' # 删除密钥 后面两个参数，appname 和 查看的密钥
alias qnmk='/home/beginman/qiniu/qboxrsctl mkbucket ' # 创建空间 后面输入空间名
alias qnprivate='/home/beginman/qiniu/qboxrsctl private ' # 将空间设为私有 后面两个参数 空间名和 1
alias qnbox='/home/beginman/qiniu/qboxrsctl buckets' # 列出所有空间
alias qnaboxinfo='/home/beginman/qiniu/qboxrsctl bucketinfo ' # 查看指定空间信息 后面输入空间名
alias qnboxdel='/home/beginman/qiniu/qboxrsctl drop -f ' # 删除指定空间 后面输入空间名
alias qnpost='/home/beginman/qiniu/qboxrsctl put beginman ' # 上传文件（这里我默认上传到beginman空间）后面两个参数 关键字和文件绝对路径
alias qnbigpost='/home/beginman/qiniu/qboxrsctl put -c beginman ' #上传大文件 参数同上
alias qndownload='/home/beginman/qiniu/qboxrsctl get beginman ' #下载文件（这里我默认上传到beginman空间）后面两个参数 关键字和文件绝对路径
alias qncatfile='/home/beginman/qiniu/qboxrsctl stat beginman ' #查看文件 后面要输入关键字
alias qndelfile='/home/beginman/qiniu/qboxrsctl del beginman ' #删除文件 后面要输入关键字
# 远程SEA地址
alias seasql_blog='cloudsql.py -u 2j34nklynl -p lk0yx45yi3wm0i25km35zk0jjwy4m3w0l23xh4iz beginman'
alias seasql_code='cloudsql.py -u mwzy52okkx -p xjwwi5i204hjklxjihjy0i3y133xzjhy4zk1wwjk codetheme'
#接口项目启动
alias pyapi='cd ~/project/TbktHttpServer/;sudo python manage.py runserver 127.0.0.1:888'
#linuxbash速查表
alias bashhelp='./myproject/myshell/bashDocument.sh'
#git速查表
alias githelp='eog myproject/myshell/git.png'
#vim速查表
alias vimhelp='eog myproject/myshell/vi_tutorial.png'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
 
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
