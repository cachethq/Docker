#!/bin/bash

# GitHub API Token
token=null

#curl -H "Authorization: token $token" -s https://api.github.com/rate_limit

# Get latest releases
CACHET_APP_LATEST_REL=$(curl -H "Authorization: token $token" -s https://api.github.com/repos/cachethq/cachet/releases/latest | jq -r .name)
CACHET_DOCKER_LATEST_REL=$(curl -H "Authorization: token $token" -s https://api.github.com/repos/cachethq/docker/releases/latest | jq -r .name)

echo "Latest Cachet release: $CACHET_APP_LATEST_REL"
echo "Latest Docker release: $CACHET_DOCKER_LATEST_REL"

# Compare versions
if [ "$CACHET_APP_LATEST_REL" == "$CACHET_DOCKER_LATEST_REL" ]
  then
    echo "Releases up to date!"
  else
    # Modify Dockerfile, commit, tag, and push
    echo "Creating tag for $CACHET_APP_LATEST_REL"
    gsed s/$CACHET_DOCKER_LATEST_REL/$CACHET_APP_LATEST_REL/g -i Dockerfile
    git commit -am "Cachet $CACHET_APP_LATEST_REL release"
    git tag -a $CACHET_APP_LATEST_REL -m "Cachet Release $CACHET_APP_LATEST_REL"
    git push origin $CACHET_APP_LATEST_REL

    # Create GitHub release
    curl -H "Authorization: token $token" -s -H "Content-Type: application/json" -d '{"tag_name":"$CACHET_APP_LATEST_REL","name":"$CACHET_APP_LATEST_REL","body":"Cachet Release $CACHET_APP_LATEST_REL","draft":false,"prerelease":false}' -X POST https://api.github.com/repos/cachethq/docker/releases
fi
