#!/usr/bin/env bash

#-----------------------------------------------------------#
#                      Installing dlogs                     #
#-----------------------------------------------------------#


dependency_checking() {

  if  !(command -v git >/dev/null 2>&1) ||
      !(command -v python3 >/dev/null 2>&1) ||
      !(command -v pip3 >/dev/null 2>&1)
  then
      echo -e "\x1B[91mError! You must have software installed: git, python3, pip3\x1B[0m"
      exit
  fi
}

installation() {
  pip3 install -r requirements.txt
  sudo cp dlogs /usr/local/bin
  chmod +x /usr/local/bin/dlogs

  echo ''
  echo -e "\x1B[92mdlogs is installed! \x1B[0mRun: \x1B[95mdlogs\x1B[0m"
  echo ''
}

user_confirmation() {
  echo -n "Continue? (y/n) [y]: "

  read -r item
  case "$item" in
      n|N)
        exit
        ;;
  esac
}

start_installation() {
  case "$(uname -s)" in
    Darwin)
      echo -e "\x1B[93mdlogs will be installed on your OS.\x1B[0m"
      ;;

    Linux)
      echo -e "\x1B[93mAttention! Installing software: dlogs, git, python3.11\x1B[0m"
      ;;
    *)
      echo -e "\x1B[91mYour OS is currently not supported :(\x1B[0m"
      exit
      ;;
  esac

  user_confirmation
  dependency_checking
  installation
}

start_installation