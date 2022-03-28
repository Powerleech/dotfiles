#!/bin/bash

repos=('api' 'test-api' 'data-api' 'realtime_websocket' 'banking-app')
REPO_NAME=$1
EXTERNAL_PORT=$2
VERSION=${3:-latest}



Help()
{
  # Display Help
  echo "
   *****************************************************************************************************************
   *      Run the script with the following args                                                                   *
   *        - 1) the name of the repo you are trying top deploy (e.g. test-api)                                    *
   *        - 2) A valid external port for the container (e.g. 8542)                                               *
   *        - (3) - OPTIONAL - A version tag of the image. If none given, it will be latest                        *
   *                                                                                                               *
   *                                                                                                               *
   *                                                                                                               *
   *      e.g. sh dockerdeploy.sh test-api 8542 1.0.5                                                              *
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

is_valid_repo() {
    for repo in "${repos[@]}"
    do
        [[ "$repo" == "$REPO_NAME" ]] && return
    done

   echo "not a valid repo"
   exit
}

create_temp_env() {
    myFileName="env-${REPO_NAME}"
    if test -e envfiles/."${myFileName}"; then
        deployName="${myFileName}-deploy"
        cp envfiles/."${myFileName}" envfiles/."${deployName}"
        # delete empty lines
        sed -i '/^$/d' envfiles/."$deployName"
        # delete lines without '='
        sed -n -i '/=/p' envfiles/."$deployName"
        # trim '='
        sed -r -i 's/\s*(=)\s*/\1/g' envfiles/."$deployName"
        echo "Env file created for production: .${deployName}"
    else
        echo "no env file was found with name ${myFileName}. The container won't run with a env file."
    fi
}


refresh_docker_container(){
FULL_REPO_NAME="raskraskdk/$REPO_NAME"
    if [[ $(docker ps -q --filter ancestor=$FULL_REPO_NAME ) ]]; then
        docker stop $(docker ps -q --filter ancestor=$FULL_REPO_NAME )
        docker rm $(docker ps -a -q --filter ancestor=$FULL_REPO_NAME )
    fi

    [[ $(docker images -q $FULL_REPO_NAME:$VERSION) ]] && docker rmi -f $(docker images -q $FULL_REPO_NAME:$VERSION )
    docker pull $FULL_REPO_NAME:$VERSION
    docker run --env-file envfiles/."${deployName}" -p $EXTERNAL_PORT:3000 --name $REPO_NAME -d $FULL_REPO_NAME:$VERSION
}

# ******************************************** Run script ****************************************

# check options given
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

# Check if reponame is given
if [[ -z "$1" ]]; then
  Help
  echo "A reponame is required"
  exit 1
fi

# Check if the reponame is valid
is_valid_repo

# Check if external port is given
if [ -z "$2" ] || ! [[ "$2" =~ [0-9]{4,} ]]; then
    Help
    echo "A valid external port must be specified"
    exit 1
fi

# Check if the optional version number is valid
if ! [ -z "$3" ] && ! [[ "$3" =~ v[0-9]+\.[0-9]+\.[0-9]+  ]]; then
    Help
    echo "Please provide a valid version number"
    exit 1
fi

# Create the production env file ready
create_temp_env
refresh_docker_container
docker ps -f name=$REPO_NAME
sleep 2
docker logs $REPO_NAME
