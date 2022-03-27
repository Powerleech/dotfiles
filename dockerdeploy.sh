#!/bin/bash

repos=('api' 'test-api' 'data-api' 'realtime_websocket' 'banking-app')
REPO_NAME=$1

Help()
{
  # Display Help
  echo "
   *****************************************************************************************************************
   *      Run the script with exactly one argument - the name of the docker repo!                                  *
   *                                                                                                               *
   *                                                                                                               *
   *                                                                                                               *
   *      The name you should give is dockerhub user followed by name of the repo                                  *
   *      FIY: Currently this script does not take tags and versioning into account.                               *
   *      thus, this script will stop ALL containers within the repo name, pull the latest version and run that.   *
   *                                                                                                               *
   *      e.g. bash dockerdeploy.sh dockerhubusername/reponame                                                     *
   *                                                                                                               *
   *      chose among the following repos:                                                                         *
   *        - api                                                                                                  *
   *        - test-api                                                                                             *
   *        - data-api                                                                                             *
   *        - realtime_websocket                                                                                   *
   *        - banking-app                                                                                          *
   *                                                                                                               *
   *                                                                                                               *
   *****************************************************************************************************************
 "
}

while getopts ":h" option; do
  case $option in
    h) # display Help
      Help
      exit;;
    \?) # incorrect option
      echo "Error: Invalid option"
      exit;;
  esac
done

if [[ $# -eq 0 ]]; then
  Help
  echo "No arguments provided"
  exit 1
fi

is_valid_repo() {
    for repo in "${repos[@]}"
    do
        [[ "$repo" == "$REPO_NAME" ]] && return
    done

   echo "no a valid repo"
   exit
}

create_temp_env() {
    myFileName="env-${REPO_NAME}"
    deployName="${myFileName}-deploy"
    echo $myFileName
    echo $deployName
    cp ./."${myFileName}" ./."${deployName}"
    sed -i '/^$/d' ./."$deployName"
    sed -n -i '/=/p' ./."$deployName"
    sed -r -i 's/\s*(=)\s*/\1/g' ./."$deployName"
    echo "Env file created for production: .${deployName}"
}


refresh_docker_container(){
FULL_REPO_NAME="raskraskdk/$REPO_NAME"
EXISTING_ID=$(docker ps -q --filter ancestor=$FULL_REPO_NAME)

}



is_valid_repo
create_temp_env
refresh_docker_container
