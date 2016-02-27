#!/bin/bash
if [ "$#" -eq 1 ]; then
    # setup debug waits
    trap "set +x; sleep 1; set -x" DEBUG
fi

workDir=$(pwd)
bkpDir=$HOME/oldConfig

if [ ! -d "$bkpDir" ]; then
    mkdir $bkpDir
fi

# TODO: make it an array of arrays
declare -a bash_files=("rc" "_profile" "_prompt" "_aliases")
declare -a vim_files=("" "rc")
declare -a hg_files=("rc")
declare -a git_files=("config" "ignore")

for file in "${bash_files[@]}"
do
    mv $HOME/.bash$file $HOME/oldConfig/
    ln -s $workDir/bash/.bash$file $HOME/.bash$file
done
for file in "${vim_files[@]}"
do
    mv $HOME/.vim$file $HOME/oldConfig/
    ln -s $workDir/vim/.vim$file $HOME/.vim$file
done
for file in "${hg_files[@]}"
do
    mv $HOME/.hg$file $HOME/oldConfig/
    ln -s $workDir/hg/.hg$file $HOME/.hg$file
done
for file in "${git_files[@]}"
do
    mv $HOME/.git$file $HOME/oldConfig/
    ln -s $workDir/git/.git$file $HOME/.git$file
done
