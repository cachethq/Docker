#!/bin/bash
#/ Usage: release-helper.sh [-hdc] <version>
#/
#/ Creates a temporary branch from which a new release will be tagged and pushed.
#/
#/ OPTIONS:
#/   -h | --help        Show this message.
#/   -d | --delete      Delete a tag / release
#/   -c | --check       Check current releases on GitHub
#/   <version>          Target Cachet Version (ex: v2.3.13)
#/
set -e

usage () {
    grep "^#/" <"$0" | cut -c4-
    exit ${1:-2}
}

[ $# -eq 0 ] && usage 1

cachet_version=

check_releases () {
# Get latest releases
CACHET_APP_LATEST_REL=$(curl -H "Authorization: token $token" -s https://api.github.com/repos/cachethq/cachet/releases/latest | jq -r .name)
CACHET_DOCKER_LATEST_REL=$(curl -H "Authorization: token $token" -s https://api.github.com/repos/cachethq/docker/releases/latest | jq -r .name)

echo "Latest Cachet release: $CACHET_APP_LATEST_REL"
echo "Latest Docker release: $CACHET_DOCKER_LATEST_REL"

# Compare versions
if [ "$CACHET_APP_LATEST_REL" = "$CACHET_DOCKER_LATEST_REL" ]
  then
    echo "Releases on GitHub are up to date!"
fi

}

delete_release () {
    if [ -z $cachet_version ]; then
      echo 1>&2 "error: no version specified."
      exit 1
    fi
    echo "Removing release $cachet_version"
    release_id=$(curl -H "Authorization: token $token" -s -X GET https://api.github.com/repos/CachetHQ/Docker/releases/tags/$cachet_version | jq -r .id)
    curl -H "Authorization: token $token" -s -X DELETE https://api.github.com/repos/CachetHQ/Docker/releases/$release_id
    git tag -d $cachet_version
    git push origin :$cachet_version
}

# GitHub API Token
token=${GITHUB_TOKEN}

if [ -z "$token" ]
  then
    echo 1>&2 "error: please set GITHUB_TOKEN in your local environment."
    exit 1
fi

# Parse args.
ARGS=$(getopt --name "$0" --long help,delete,check --options hdc -- "$@") || {
  usage
  exit 2
}
eval set -- $ARGS

while [ $# -gt 0 ]; do
  shift
  case "$1" in
    -h|--help)
      usage
      exit 2
      ;;
    -d|--delete)
      cachet_version=$2
      delete_release
      exit 0
      ;;
    -c|--check)
      check_releases
      exit 0
      ;;
    --)
      cachet_version=$2
      shift
      break
      ;;
  esac
  shift
done

if [ -z $cachet_version ]; then
    echo 1>&2 "error: no version specified."
    exit 1
fi

#curl -H "Authorization: token $token" -s https://api.github.com/rate_limit

# Make sure we are on clean branch
git checkout -b cachet-$cachet_version

# Generate changelog (requires https://github.com/skywinder/github-changelog-generator)
if hash github_changelog_generator 2>/dev/null; then
  github_changelog_generator --token $token --future-release $cachet_version
fi

# Modify Dockerfile, commit, tag, and push
echo "Creating tag for $cachet_version"
sed s/master/$cachet_version/g -i Dockerfile
git commit -am "Cachet $cachet_version release"
git tag -a $cachet_version -m "Cachet Release $cachet_version"
git push origin $cachet_version

# Create GitHub release
curl -H "Authorization: token $token" -s -H "Content-Type: application/json" -d '{"tag_name":"'${cachet_version}'","name":"'${cachet_version}'","body":"Cachet Release '${cachet_version}'","draft":false,"prerelease":false}' -X POST https://api.github.com/repos/CachetHQ/Docker/releases
