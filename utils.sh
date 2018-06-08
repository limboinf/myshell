#!/bin/bash

#
# Set colors
#

bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)


#
# Headers and Logging
#

e_header () {
    printf "\n${bold}${purple}========== %s ==========${reset}\n" "$@"
}

e_arrow() {
    printf "➜ $@\n"
}

e_success() {
    printf "${green}✔ %s ${reset}\n" "$@"
}

e_error() {
    printf "${red}✖ %s ${reset}\n" "$@"
}

e_warning() {
    printf "${tan}➜ %s ${reset}\n" "$@"
}

e_underline() {
    printf "${underline}${bold}%s${reset}\n" "$@"
}

e_bold() {
    printf "${bold}%s${reset}\n" "$@"
}
e_note() {
    printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
}

seek_confirmation() {
  printf "\n${bold}$@${reset}"
  read -p " (y/n) " -n 1
  printf "\n"
}

# Test whether the result of an 'ask' is a confirmation
is_confirmed() {
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      return 0
    fi
    return 1
}

# command test
type_exists() {
    if [ $(type -P $1) ]; then
        return 0
    fi
    return 1
}


# os test
is_os() {
    if [[ "${OSTYPE}" == $1* ]]; then
        return 0
    fi
    return 1
}

# join

function join_by { local IFS="$1"; shift; echo "$*"; }


# send dingTalk

dingTalk() {
    DING="https://oapi.dingtalk.com/robot/send?access_token="$DINGTOKEN
    MSG=`printf '{"msgtype": "text", "text": {"content": "%s"}}' "$1"`
    curl ${DING} -H 'Content-Type: application/json' -d "$MSG" > /dev/null 2>&1
}
