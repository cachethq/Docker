# Contribution Guidelines

## Creating issues

Feature requests and bug reports should be made by using the [issue tracker](https://github.com/cachethq/Docker/issues). This "Dockerized" version of Cachet is maintained by members the Cachet community, so support issues will be address on a best effort basis.

**Always be respectful.** Organization members reserve the right to lock topics if they feel necessary.

## Branch and Tag Structure

* `master`: Cachet with the upstream Cachet `master` codebase.
* Minor version branches
* Tags are used to denote a Cachet release, and correspond to Docker Hub automatic builds.

# Releasing a new Cachet Docker image version

The below example shows creating a `v2.3.1` release.

```
git checkout 2.3
git checkout -b rel-2.3.1
Set `ENV cachetversion v2.3.1` in Dockerfile
git commit -am "Cachet v2.3.1 release"
git tag -a v2.3.1 -m "Cachet Release v2.3.1"
git push origin v2.3.1
```

Then to finish the process:

* Add [Release on GitHub](https://github.com/CachetHQ/Docker/releases)
* Add automated build for the new tag on [Docker Hub](https://hub.docker.com/r/cachethq/docker/builds/)

Periodically back-port changes from most recent minor version branch to `master`.

## Multiple releases

Sometimes we get a little behind the upstream Cachet project, and need to make a few releases at once. 

```
gsed s/v2.3.7/v2.3.8/g -i Dockerfile
git commit -am "Cachet v2.3.8 release"
git tag -a v2.3.8 -m "Cachet Release v2.3.8"
git push origin v2.3.8

gsed s/v2.3.8/v2.3.9/g -i Dockerfile
git commit -am "Cachet v2.3.9 release"
git tag -a v2.3.9 -m "Cachet Release v2.3.9"
git push origin v2.3.9

gsed s/v2.3.9/v2.3.10/g -i Dockerfile
git commit -am "Cachet v2.3.10 release"
git tag -a v2.3.10 -m "Cachet Release v2.3.10"
git push origin v2.3.10
```

Then setup releases on GitHub.
