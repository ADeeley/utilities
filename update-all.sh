#V0.0.1 - Created as a manual version for repositories that have differently names 'master'
#Branches
#
#TODO:
# - Create Python version that detects all repos in the directory
#
#Run with the command: ./update-all.sh
#
#Update this line to your root directory. This script assumes that all the repositories share a root directory

root_directory=''

navigate_to_directory_root() {
  cd $root_directory
}

message() {
  echo ''
  echo '***** Resetting '${1}' *****'
  echo ''
}

reset_repo() {
  git stash && git checkout ${1} && git pull && git pull origin --prune
}

run() {
	navigate_to_directory_root
	cd ${1}
	message ${1}
	reset_repo 'master'
	npm i
}

##Example
run 'test-app'
