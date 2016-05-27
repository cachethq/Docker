# Contribution Guidelines

## Creating issues

Feature requests and bug reports should be made by using the [issue tracker](https://github.com/cachethq/Docker/issues). This "Dockerized" version of Cachet is maintained by members the Cachet community, so support issues will be address on a best effort basis.

**Always be respectful.** Organization members reserve the right to lock topics if they feel necessary.

## Branch and Tag Structure

* `master`: Cachet with the upstream Cachet `master` codebase.
* Tags are used to denote a Cachet release, and correspond to Docker Hub automatic builds.

# Releasing a new Cachet Docker image version

The below example shows creating a `v2.2.1` release.

```
git checkout master
git checkout -b rel-2.2.1
Set `ENV cachetversion=v2.2.1` in Dockerfile
git commit -am "Cachet v2.2.1 release"
git tag -a v2.2.1 -m "Cachet Release v2.2.1"
git push origin v2.2.1
```

Then to finish the process:

* Add [Release on GitHub](https://github.com/CachetHQ/Docker/releases)
* Add automated build for the new tag on [Docker Hub](https://hub.docker.com/r/cachethq/docker/builds/)
