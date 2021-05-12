#!/bin/bash

# add credHelpers 
gcloud auth configure-docker

if [ "$BRANCH_NAME" = "master" ]; then
    tag="1.0.$BUILD_NUMBER"
    docker tag echo:1.0 eu.gcr.io/finalexam-267908/echo:$tag
    docker push eu.gcr.io/finalexam-267908/echo:$tag
                            

elif [ "$BRANCH_NAME" = "dev" ]; then
    tag_tail=$(git rev-parse HEAD)
    full_tag="dev-$tag_tail"
    docker tag echo:1.0 eu.gcr.io/finalexam-267908/echo:$full_tag
    docker push eu.gcr.io/finalexam-267908/echo:$full_tag

else 
    tag_tail=$(git rev-parse HEAD)
    full_tag="staging-$tag_tail"
    docker tag echo:1.0 eu.gcr.io/finalexam-267908/echo:$full_tag
    docker push eu.gcr.io/finalexam-267908/echo:$full_tag
                 
fi 
