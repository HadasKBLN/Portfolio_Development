#!/bin/bash

# add credHelpers 
gcloud auth configure-docker
# export TAG=""
echo $BRANCH_NAME
if [ "$BRANCH_NAME" = "main" ]; then
    export TAG="1.0.$BUILD_NUMBER"                         

elif [ "$BRANCH_NAME" = "dev" ]; then
    tag_tail=$(git rev-parse HEAD)
    export TAG="dev-$tag_tail"
    # docker tag echo:1.0 eu.gcr.io/finalexam-267908/echo:$full_tag
    # docker push eu.gcr.io/finalexam-267908/echo:$full_tag

else 
    tag_tail=$(git rev-parse HEAD)
    export TAG="staging-$tag_tail"
    # docker tag echo:1.0 eu.gcr.io/finalexam-267908/echo:$full_tag
    # docker push eu.gcr.io/finalexam-267908/echo:$full_tag
                 
fi 

docker tag server:1.0 eu.gcr.io/devops-portfolio/contact_manegment:$TAG
# docker push eu.gcr.io/devops-portfolio/contact_manegment:$TAG
