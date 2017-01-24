#!/bin/bash

## create directory and cd into it
mkcd_fn() {
        mkdir $1
        cd $1
}
alias mkcd=mkcd_fn

## define `up N` to cd up N directories
function cd_fn() {
  cd $(printf "%.0s../" $(seq 1 $1))
}
alias up=cd_fn

## `mkdirs a b c` will create that directory structure without cd'ing into any of them
function mkdirs_fn() {
  itr=0
  for dirs in "$@"; do # get all args
    mkcd $dirs
    itr=$((itr+1))
  done
  up $itr
}
alias mkdirs=mkdirs_fn
