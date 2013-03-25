#!/bin/bash

if [ ! $# == 3 ]; then
  echo "Usage: $0 hook_type hook_name dest_repo_path"
  exit
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "$DIR/../$1/$2"
echo `env | sort`
if [ -f "$DIR/../$1/$2" ]; then
  cp "$DIR/../$1/$2" "$3/.git/hooks/$1"
  echo "$1 hook $2 installed in repo $3"
else
  echo "Unknown hook script $2 of type $1"
fi