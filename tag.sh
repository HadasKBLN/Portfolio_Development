#!/bin/bash

# add credHelpers 
gcloud auth configure-docker

if [ "$BRANCH_NAME" = "main" ]; then
    export TAG="1.0.$BUILD_NUMBER" 
elif [ "$BRANCH_NAME" = "dev" ]; then
    tag_tail=$(git rev-parse HEAD)
    export TAG="dev-$tag_tail"

else 
    tag_tail=$(git rev-parse HEAD)
    export TAG="staging-$tag_tail"
                 
fi 

docker tag server:1.0 eu.gcr.io/devops-portfolio/contact_manegment:$TAG
docker push eu.gcr.io/devops-portfolio/contact_manegment:$TAG
