# Contribution Guidelines

## Creating issues

Feature requests and bug reports should be made by using the [issue tracker](https://github.com/cachethq/Docker/issues). This "Dockerized" version of Cachet is maintained by members the Cachet community, so support issues will be address on a best effort basis.

**Always be respectful.** Organization members reserve the right to lock topics if they feel necessary.

## Branch Structure

The following describes the purpose of each branch within the repository.

* `base`: Base image containing dependancies for running Cachet. Based on official `debian:jessie` Docker image. New versions are tagged as `base-<commit hash>` where `<commit hash>` is the first 7 characters of the commit hash. __Deprecated as of [#37](https://github.com/CachetHQ/Docker/pull/37)__
* `master`: Cachet with the upstream Cachet `master` codebase.
* `1.2`: Used for tagging _v1.2.x_ releases.
* `2.0`: Used for tagging _v2.0.x_ releases.

# Releasing a new Cachet version

The below example shows bumping to a `v2.0.4` release from `v2.0.3`.

```
git checkout 2.0
git checkout -b rel-2.0.4
sed -i s/v2.0.3/v2.0.4/g Dockerfile
git commit -am "Cachet v2.0.4 release"
git push origin rel-2.0.4
<Submit Merge request to `2.0` branch, continue once merged>
git checkout 2.0
git pull
git tag -a v2.0.4 -m "Cachet Release v2.0.4"
git push origin v2.0.4
<Add Release on GitHub>
<Add automated build for the tag on Docker Hub>
```

Releasing new base images follow the same workflow, just using the first 7 characters commit hash rather than a version number.
