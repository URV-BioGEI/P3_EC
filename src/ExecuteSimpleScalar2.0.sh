#!/bin/bash
# A script to execute all the benchmarks Simple Scalar from the third practic of Computer Structures subject in URV
# Author: Aleix Mariné (aleix.marine@estudiants.urv.cat)
# Created on 28/5/18
# Last Update 27/5/2020

# Checks if Google Chrome is already installed and installs it and its dependencies
# Needs root permission
install_simple_scalar()
{
  echo "Attempting to install Simple Scalar"	

  wget -P "res" http://www.simplescalar.com/gatedftp.php3?simplesim-3v0e.tgz
  tar -xvf res/simplesim-3v0e.tgz 
  make config-pisa
  make config-alpha 
  make

  echo "Finished"
}


##################
###### MAIN ######
##################
function main()
{
  if [[ ! -d "res" ]]; then
  	echo "Unable to locate benchmark files. Relaunch the script from the root of the repository and try again."
  	exit 1
  fi

  install_simple_scalar



  
  return 0
}

# Script will exit if any command fails
set -e

# Call main function
main "$@"
