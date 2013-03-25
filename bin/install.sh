#!/bin/bash

if [ ! $# == 3 ]; then
  echo "Usage: $0 hook_type hook_name dest_repo_path"
  exit
fi

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

if [ ! -f "$3" ]; then
  echo "Repo $3 does not exist."
  exit
fi

if [ -f "$DIR/../$1/$2" ]; then
  cp "$DIR/../$1/$2" "$3/.git/hooks/$1"
  echo "$1 hook $2 installed in repo $3"
else
  echo "Unknown hook script $2 of type $1"
fi