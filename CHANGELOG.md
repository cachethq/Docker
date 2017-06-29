# Change Log

## [v2.3.12](https://github.com/CachetHQ/Docker/tree/v2.3.12) (2017-06-29)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.11...v2.3.12)

**Implemented enhancements:**

- Switch to Alpine Linux [\#200](https://github.com/CachetHQ/Docker/pull/200) ([djdefi](https://github.com/djdefi))

**Fixed bugs:**

- PGSQL ignores DB\_PORT [\#206](https://github.com/CachetHQ/Docker/issues/206)

**Closed issues:**

- Enable seedfile for auto-deploy in pipelines [\#212](https://github.com/CachetHQ/Docker/issues/212)
- error 500 connection refused fastcgi [\#208](https://github.com/CachetHQ/Docker/issues/208)
- 500 error during setup [\#207](https://github.com/CachetHQ/Docker/issues/207)
- Error 500 after installation [\#199](https://github.com/CachetHQ/Docker/issues/199)
- Set the default port to 8000 in the documentation [\#198](https://github.com/CachetHQ/Docker/issues/198)
- Question: Why not use different Dockerfiles? [\#196](https://github.com/CachetHQ/Docker/issues/196)
- Create new tag with Nginx in app container [\#148](https://github.com/CachetHQ/Docker/issues/148)

**Merged pull requests:**

- Remove docker version pin in CI [\#215](https://github.com/CachetHQ/Docker/pull/215) ([djdefi](https://github.com/djdefi))
- Fixes \#206 by using psql port defined in env var [\#211](https://github.com/CachetHQ/Docker/pull/211) ([gottfrois](https://github.com/gottfrois))
- fixing mysql ignores DB\_PORT envvar at connection [\#205](https://github.com/CachetHQ/Docker/pull/205) ([naorlivne](https://github.com/naorlivne))
- Revert "The right git repo" [\#204](https://github.com/CachetHQ/Docker/pull/204) ([jbrooksuk](https://github.com/jbrooksuk))
- The right git repo [\#203](https://github.com/CachetHQ/Docker/pull/203) ([riemers](https://github.com/riemers))
- Update Nginx 1.12 [\#202](https://github.com/CachetHQ/Docker/pull/202) ([butuh](https://github.com/butuh))

## [v2.3.11](https://github.com/CachetHQ/Docker/tree/v2.3.11) (2017-04-16)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.10...v2.3.11)

**Implemented enhancements:**

- Add "restart: always" property [\#194](https://github.com/CachetHQ/Docker/issues/194)
- Nginx max\_children [\#162](https://github.com/CachetHQ/Docker/issues/162)
- New ENV vars for notifications in 2.4 [\#149](https://github.com/CachetHQ/Docker/issues/149)
- Support all possible ENV vars [\#135](https://github.com/CachetHQ/Docker/issues/135)
- Upgrade pg\_dump to 9.5 to perform database backup [\#123](https://github.com/CachetHQ/Docker/issues/123)
- redirect php-fpm log to stdout/stderr [\#121](https://github.com/CachetHQ/Docker/issues/121)
- Script release process [\#119](https://github.com/CachetHQ/Docker/issues/119)
- Consider whitelisting on .dockerignore instead of blacklisting [\#116](https://github.com/CachetHQ/Docker/issues/116)
- Beacons in 2.4 [\#114](https://github.com/CachetHQ/Docker/issues/114)
- single container for PaaS deployment [\#103](https://github.com/CachetHQ/Docker/issues/103)
- Add CHANGELOG.md [\#191](https://github.com/CachetHQ/Docker/pull/191) ([djdefi](https://github.com/djdefi))
- APP\_KEY ENV [\#190](https://github.com/CachetHQ/Docker/pull/190) ([djdefi](https://github.com/djdefi))
- Add more ENV vars [\#189](https://github.com/CachetHQ/Docker/pull/189) ([djdefi](https://github.com/djdefi))
- Add Cachet Beacon env var [\#186](https://github.com/CachetHQ/Docker/pull/186) ([djdefi](https://github.com/djdefi))
- Nginx ttfb tweaks [\#183](https://github.com/CachetHQ/Docker/pull/183) ([djdefi](https://github.com/djdefi))
- Attempt to launch as a regular user [\#178](https://github.com/CachetHQ/Docker/pull/178) ([djdefi](https://github.com/djdefi))
- Bump to docker-compose version 3 [\#174](https://github.com/CachetHQ/Docker/pull/174) ([djdefi](https://github.com/djdefi))
- Replace cron with artisan queue worker [\#173](https://github.com/CachetHQ/Docker/pull/173) ([djdefi](https://github.com/djdefi))
- Added environment setup for pm.max\_children, default:5 [\#169](https://github.com/CachetHQ/Docker/pull/169) ([s4mur4i](https://github.com/s4mur4i))
- Add some restart tests [\#166](https://github.com/CachetHQ/Docker/pull/166) ([djdefi](https://github.com/djdefi))
- added openshift yaml files and readme [\#154](https://github.com/CachetHQ/Docker/pull/154) ([gamkiller77](https://github.com/gamkiller77))
- Add support for redis password [\#143](https://github.com/CachetHQ/Docker/pull/143) ([jadb](https://github.com/jadb))
- Added instructions for development of Cachet using this environment [\#141](https://github.com/CachetHQ/Docker/pull/141) ([xRahul](https://github.com/xRahul))
- Make composer version a variable and bump to 1.2.1 [\#140](https://github.com/CachetHQ/Docker/pull/140) ([axilleas](https://github.com/axilleas))
- update nginx to latest stable version [\#137](https://github.com/CachetHQ/Docker/pull/137) ([Madhu1512](https://github.com/Madhu1512))
- Allow caching of fonts [\#118](https://github.com/CachetHQ/Docker/pull/118) ([mcfedr](https://github.com/mcfedr))

**Fixed bugs:**

- checkdbinitpsql function doesnt use DB\_DATABASE variable [\#177](https://github.com/CachetHQ/Docker/issues/177)
- Add cachet\_ver ARG to docker-compose.yml [\#187](https://github.com/CachetHQ/Docker/pull/187) ([djdefi](https://github.com/djdefi))
- fix. cachet\_ver couldn't be overrided with ARG [\#142](https://github.com/CachetHQ/Docker/pull/142) ([mathieuruellan](https://github.com/mathieuruellan))
- Remove the duplicate php5-mysql package from Dockerfile [\#139](https://github.com/CachetHQ/Docker/pull/139) ([axilleas](https://github.com/axilleas))

**Closed issues:**

- How to install Cachethq on synology [\#197](https://github.com/CachetHQ/Docker/issues/197)
- Release with NGINX [\#170](https://github.com/CachetHQ/Docker/issues/170)
- Download cachet to /usr/src [\#161](https://github.com/CachetHQ/Docker/issues/161)
- Do you have a verison of the docker cachet code for deployment in kubernetes/minikube? [\#159](https://github.com/CachetHQ/Docker/issues/159)
- docker-compose skips the database backup because of a postgres protocol mismatch [\#156](https://github.com/CachetHQ/Docker/issues/156)
- docker-compose install instructions should use cachetdocker\_cachet\_1 as container reference [\#155](https://github.com/CachetHQ/Docker/issues/155)
- Combine Cachet and nginx in same container [\#150](https://github.com/CachetHQ/Docker/issues/150)
- Best way to move a docker image from one server to another. [\#147](https://github.com/CachetHQ/Docker/issues/147)
- Nginx conf only accepts localhost connections [\#144](https://github.com/CachetHQ/Docker/issues/144)
- Container command '/sbin/entrypoint.sh' not found or does not exist. [\#136](https://github.com/CachetHQ/Docker/issues/136)
- nginx logging to stdout broken [\#132](https://github.com/CachetHQ/Docker/issues/132)
- Permission denied on start cachet [\#124](https://github.com/CachetHQ/Docker/issues/124)
- Don't use volumes to share code between nginx & fpm [\#106](https://github.com/CachetHQ/Docker/issues/106)

**Merged pull requests:**

- Added "restart: always" property [\#195](https://github.com/CachetHQ/Docker/pull/195) ([felixoi](https://github.com/felixoi))
- Updated Nginx to latest stable release [\#192](https://github.com/CachetHQ/Docker/pull/192) ([Madhu1512](https://github.com/Madhu1512))
- Backport master to 2.3 [\#188](https://github.com/CachetHQ/Docker/pull/188) ([djdefi](https://github.com/djdefi))
- Update container name in dev guide README.md [\#181](https://github.com/CachetHQ/Docker/pull/181) ([djdefi](https://github.com/djdefi))
- DB init w/ custom DB name fixes [\#179](https://github.com/CachetHQ/Docker/pull/179) ([djdefi](https://github.com/djdefi))
- Apt source add syntax [\#176](https://github.com/CachetHQ/Docker/pull/176) ([djdefi](https://github.com/djdefi))
- More process logs to stdout [\#172](https://github.com/CachetHQ/Docker/pull/172) ([djdefi](https://github.com/djdefi))
- Revert "Test backport master -\> 2.3" [\#167](https://github.com/CachetHQ/Docker/pull/167) ([djdefi](https://github.com/djdefi))
- Remove volume from Dockerfile [\#165](https://github.com/CachetHQ/Docker/pull/165) ([djdefi](https://github.com/djdefi))
- Bump docker version in travis [\#164](https://github.com/CachetHQ/Docker/pull/164) ([djdefi](https://github.com/djdefi))
- Test backport master -\> 2.3 [\#163](https://github.com/CachetHQ/Docker/pull/163) ([djdefi](https://github.com/djdefi))
- adding all the ENV to the yaml file when deploying [\#157](https://github.com/CachetHQ/Docker/pull/157) ([gamkiller77](https://github.com/gamkiller77))
- Fix readme formatting [\#153](https://github.com/CachetHQ/Docker/pull/153) ([djdefi](https://github.com/djdefi))
- Do not enclose env vars with double quotes [\#151](https://github.com/CachetHQ/Docker/pull/151) ([mattallty](https://github.com/mattallty))
- Add rest of env vars [\#145](https://github.com/CachetHQ/Docker/pull/145) ([djdefi](https://github.com/djdefi))
- Use prestissimo for parallel composer installs [\#138](https://github.com/CachetHQ/Docker/pull/138) ([djdefi](https://github.com/djdefi))
- Set entrypoint perms [\#134](https://github.com/CachetHQ/Docker/pull/134) ([djdefi](https://github.com/djdefi))
- Enable nginx logs to stdout and stderr [\#133](https://github.com/CachetHQ/Docker/pull/133) ([djdefi](https://github.com/djdefi))
- Add release-helper script [\#130](https://github.com/CachetHQ/Docker/pull/130) ([djdefi](https://github.com/djdefi))
- Include nginx in Cachet image [\#129](https://github.com/CachetHQ/Docker/pull/129) ([djdefi](https://github.com/djdefi))
- Use whitelist in .dockerignore [\#128](https://github.com/CachetHQ/Docker/pull/128) ([djdefi](https://github.com/djdefi))
- log php-fpm to stdout [\#127](https://github.com/CachetHQ/Docker/pull/127) ([djdefi](https://github.com/djdefi))
- Use apt.postgresql.org for client packages [\#126](https://github.com/CachetHQ/Docker/pull/126) ([djdefi](https://github.com/djdefi))
- 2.3.10 backport master [\#117](https://github.com/CachetHQ/Docker/pull/117) ([djdefi](https://github.com/djdefi))

## [v2.3.10](https://github.com/CachetHQ/Docker/tree/v2.3.10) (2016-08-15)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.9...v2.3.10)

## [v2.3.9](https://github.com/CachetHQ/Docker/tree/v2.3.9) (2016-08-15)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.8...v2.3.9)

## [v2.3.8](https://github.com/CachetHQ/Docker/tree/v2.3.8) (2016-08-15)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.7...v2.3.8)

**Closed issues:**

- Cachet 2.3.x releases [\#111](https://github.com/CachetHQ/Docker/issues/111)
- Outdated documentation regarding key generation and app initialization ? [\#110](https://github.com/CachetHQ/Docker/issues/110)
- I get an error with docker-compose --verbose up  [\#108](https://github.com/CachetHQ/Docker/issues/108)

## [v2.3.7](https://github.com/CachetHQ/Docker/tree/v2.3.7) (2016-08-04)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.6...v2.3.7)

## [v2.3.6](https://github.com/CachetHQ/Docker/tree/v2.3.6) (2016-08-04)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.5...v2.3.6)

## [v2.3.5](https://github.com/CachetHQ/Docker/tree/v2.3.5) (2016-08-04)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.4...v2.3.5)

## [v2.3.4](https://github.com/CachetHQ/Docker/tree/v2.3.4) (2016-08-04)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.3...v2.3.4)

## [v2.3.3](https://github.com/CachetHQ/Docker/tree/v2.3.3) (2016-08-04)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.2...v2.3.3)

## [v2.3.2](https://github.com/CachetHQ/Docker/tree/v2.3.2) (2016-08-04)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.1...v2.3.2)

## [v2.3.1](https://github.com/CachetHQ/Docker/tree/v2.3.1) (2016-08-04)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.0...v2.3.1)

## [v2.3.0](https://github.com/CachetHQ/Docker/tree/v2.3.0) (2016-08-04)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.0-RC6...v2.3.0)

**Implemented enhancements:**

- Using volume to persist db data [\#92](https://github.com/CachetHQ/Docker/issues/92)

**Closed issues:**

- Pinned package are not present anymore in debain repo [\#112](https://github.com/CachetHQ/Docker/issues/112)
- '/sbin/entrypoint.sh' not found or does not exist [\#109](https://github.com/CachetHQ/Docker/issues/109)
- Error 500 \(Components and Dashboard\) [\#107](https://github.com/CachetHQ/Docker/issues/107)
- HTTP 500 Error after Login [\#102](https://github.com/CachetHQ/Docker/issues/102)

**Merged pull requests:**

- Rel 2.3.0 [\#115](https://github.com/CachetHQ/Docker/pull/115) ([djdefi](https://github.com/djdefi))
- Unpin packages and make composer install better [\#113](https://github.com/CachetHQ/Docker/pull/113) ([djdefi](https://github.com/djdefi))
- Write-good suggestions [\#105](https://github.com/CachetHQ/Docker/pull/105) ([djdefi](https://github.com/djdefi))
- Update composer sha384 [\#104](https://github.com/CachetHQ/Docker/pull/104) ([atmosx](https://github.com/atmosx))
- Add BSD-3 clause license [\#101](https://github.com/CachetHQ/Docker/pull/101) ([djdefi](https://github.com/djdefi))
- Add testing info to readme. [\#100](https://github.com/CachetHQ/Docker/pull/100) ([djdefi](https://github.com/djdefi))
- fixes \#92 - adding postgres volume [\#99](https://github.com/CachetHQ/Docker/pull/99) ([djdefi](https://github.com/djdefi))
- Pin versions for all packages [\#98](https://github.com/CachetHQ/Docker/pull/98) ([djdefi](https://github.com/djdefi))
- Verify composer installer and version pin [\#97](https://github.com/CachetHQ/Docker/pull/97) ([djdefi](https://github.com/djdefi))
- 2.3 backports [\#96](https://github.com/CachetHQ/Docker/pull/96) ([djdefi](https://github.com/djdefi))

## [v2.3.0-RC6](https://github.com/CachetHQ/Docker/tree/v2.3.0-RC6) (2016-06-16)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.2.4...v2.3.0-RC6)

**Merged pull requests:**

- Rel 2.3.0 rc6 [\#95](https://github.com/CachetHQ/Docker/pull/95) ([djdefi](https://github.com/djdefi))

## [v2.2.4](https://github.com/CachetHQ/Docker/tree/v2.2.4) (2016-06-16)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.2.3...v2.2.4)

**Implemented enhancements:**

- Add api test [\#93](https://github.com/CachetHQ/Docker/pull/93) ([djdefi](https://github.com/djdefi))

**Merged pull requests:**

- Cachet v2.2.4 release [\#94](https://github.com/CachetHQ/Docker/pull/94) ([djdefi](https://github.com/djdefi))

## [v2.2.3](https://github.com/CachetHQ/Docker/tree/v2.2.3) (2016-06-06)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.0-RC2...v2.2.3)

**Implemented enhancements:**

- Rename docker directory [\#85](https://github.com/CachetHQ/Docker/issues/85)
- QA testing suite [\#83](https://github.com/CachetHQ/Docker/issues/83)

**Closed issues:**

- 2.3 Branch Needed [\#76](https://github.com/CachetHQ/Docker/issues/76)

**Merged pull requests:**

- 2.3 backport to master [\#91](https://github.com/CachetHQ/Docker/pull/91) ([djdefi](https://github.com/djdefi))
- Add bats QA tests [\#90](https://github.com/CachetHQ/Docker/pull/90) ([djdefi](https://github.com/djdefi))
- 2.3 backport [\#88](https://github.com/CachetHQ/Docker/pull/88) ([djdefi](https://github.com/djdefi))
- Fix DB connect warning message [\#87](https://github.com/CachetHQ/Docker/pull/87) ([djdefi](https://github.com/djdefi))

## [v2.3.0-RC2](https://github.com/CachetHQ/Docker/tree/v2.3.0-RC2) (2016-05-27)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.2.2...v2.3.0-RC2)

**Merged pull requests:**

- 2.3 Image enhancements  [\#82](https://github.com/CachetHQ/Docker/pull/82) ([djdefi](https://github.com/djdefi))
- Use PgSQL default \(\#78\) \(\#79\) [\#80](https://github.com/CachetHQ/Docker/pull/80) ([djdefi](https://github.com/djdefi))
- Use PgSQL default \(\#78\) [\#79](https://github.com/CachetHQ/Docker/pull/79) ([djdefi](https://github.com/djdefi))
- Use PgSQL default [\#78](https://github.com/CachetHQ/Docker/pull/78) ([jbrooksuk](https://github.com/jbrooksuk))
- Don't generate key anymore [\#75](https://github.com/CachetHQ/Docker/pull/75) ([jbrooksuk](https://github.com/jbrooksuk))
- Add Travis CI support [\#73](https://github.com/CachetHQ/Docker/pull/73) ([djdefi](https://github.com/djdefi))

## [v2.2.2](https://github.com/CachetHQ/Docker/tree/v2.2.2) (2016-05-24)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.2.1...v2.2.2)

**Closed issues:**

- Master broken`? [\#72](https://github.com/CachetHQ/Docker/issues/72)
- 500 error - Docker install [\#69](https://github.com/CachetHQ/Docker/issues/69)
- Error 500 after restart [\#68](https://github.com/CachetHQ/Docker/issues/68)
- Cachet doesnt start - Install loop [\#67](https://github.com/CachetHQ/Docker/issues/67)
- Errors 500 [\#66](https://github.com/CachetHQ/Docker/issues/66)

**Merged pull requests:**

- Fix for APP\_KEY not being set in .env file [\#71](https://github.com/CachetHQ/Docker/pull/71) ([Jamie-Owen](https://github.com/Jamie-Owen))
- Fixes the crontab syntax [\#70](https://github.com/CachetHQ/Docker/pull/70) ([jbrooksuk](https://github.com/jbrooksuk))
- Update and simplify release process [\#65](https://github.com/CachetHQ/Docker/pull/65) ([djdefi](https://github.com/djdefi))

## [v2.2.1](https://github.com/CachetHQ/Docker/tree/v2.2.1) (2016-04-26)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.2.0...v2.2.1)

**Implemented enhancements:**

- Include startup actions like "migrate" [\#36](https://github.com/CachetHQ/Docker/issues/36)
- SMTP mail driver won't send emails [\#30](https://github.com/CachetHQ/Docker/issues/30)
- Revert to Jessie + init fixes [\#58](https://github.com/CachetHQ/Docker/pull/58) ([djdefi](https://github.com/djdefi))

**Fixed bugs:**

- PHP-APC is not included to docker container [\#57](https://github.com/CachetHQ/Docker/issues/57)
- Error when subscribe using version 2.0.4 \(Docker\) [\#32](https://github.com/CachetHQ/Docker/issues/32)

**Closed issues:**

- Incorrect default value for queue driver [\#63](https://github.com/CachetHQ/Docker/issues/63)
- Container won't start [\#60](https://github.com/CachetHQ/Docker/issues/60)
- Exception when trying upgrade Cachet version [\#54](https://github.com/CachetHQ/Docker/issues/54)
- Error 500 after restart the container [\#34](https://github.com/CachetHQ/Docker/issues/34)

**Merged pull requests:**

- Use alpine based nginx [\#62](https://github.com/CachetHQ/Docker/pull/62) ([djdefi](https://github.com/djdefi))
- Fixes issue where .env file is invalid [\#61](https://github.com/CachetHQ/Docker/pull/61) ([adamlc](https://github.com/adamlc))
- Update .dockerignore [\#59](https://github.com/CachetHQ/Docker/pull/59) ([djdefi](https://github.com/djdefi))

## [v2.2.0](https://github.com/CachetHQ/Docker/tree/v2.2.0) (2016-04-05)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.1.2...v2.2.0)

**Fixed bugs:**

- Missing VOLUME command in Dockerfile [\#55](https://github.com/CachetHQ/Docker/issues/55)

**Closed issues:**

- Missing webserver on latest image [\#56](https://github.com/CachetHQ/Docker/issues/56)

## [v2.1.2](https://github.com/CachetHQ/Docker/tree/v2.1.2) (2016-03-04)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.1.1...v2.1.2)

**Merged pull requests:**

- Cachet v2.1.2 release [\#53](https://github.com/CachetHQ/Docker/pull/53) ([djdefi](https://github.com/djdefi))

## [v2.1.1](https://github.com/CachetHQ/Docker/tree/v2.1.1) (2016-03-04)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.1.0...v2.1.1)

**Merged pull requests:**

- Cachet v2.1.1 release [\#52](https://github.com/CachetHQ/Docker/pull/52) ([djdefi](https://github.com/djdefi))

## [v2.1.0](https://github.com/CachetHQ/Docker/tree/v2.1.0) (2016-03-04)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.0.4...v2.1.0)

**Implemented enhancements:**

- Upgrade to PHP 7 for 2.1.0 [\#38](https://github.com/CachetHQ/Docker/issues/38)
- Upgrade to postgres 9.5 for cachet 2.1.0 [\#27](https://github.com/CachetHQ/Docker/issues/27)
- replace installed nginx with separate container [\#46](https://github.com/CachetHQ/Docker/pull/46) ([zemirco](https://github.com/zemirco))
- Improve Dockerfile based on lint test [\#33](https://github.com/CachetHQ/Docker/pull/33) ([djdefi](https://github.com/djdefi))

**Closed issues:**

- rename this repo [\#44](https://github.com/CachetHQ/Docker/issues/44)
- nginx as container instead internal instance [\#43](https://github.com/CachetHQ/Docker/issues/43)
- Dockerfile for "cachethq/docker:base-5a0320b"? [\#35](https://github.com/CachetHQ/Docker/issues/35)
- No connector for \[\] [\#29](https://github.com/CachetHQ/Docker/issues/29)
- Branch names inconsistent? [\#26](https://github.com/CachetHQ/Docker/issues/26)
- 1.2.1 tag name incorrect [\#25](https://github.com/CachetHQ/Docker/issues/25)
- 504 Bad Gateway [\#19](https://github.com/CachetHQ/Docker/issues/19)

**Merged pull requests:**

- Cachet v2.1.0 release [\#51](https://github.com/CachetHQ/Docker/pull/51) ([djdefi](https://github.com/djdefi))
- Cachet v2.1.2 release [\#50](https://github.com/CachetHQ/Docker/pull/50) ([djdefi](https://github.com/djdefi))
- Cachet v2.1.1 release [\#49](https://github.com/CachetHQ/Docker/pull/49) ([djdefi](https://github.com/djdefi))
- Bump postgres to 9.5 [\#48](https://github.com/CachetHQ/Docker/pull/48) ([djdefi](https://github.com/djdefi))
- Switch to php7.0 [\#47](https://github.com/CachetHQ/Docker/pull/47) ([djdefi](https://github.com/djdefi))
- Revert "Remove unused packages ca-certificates and git" [\#41](https://github.com/CachetHQ/Docker/pull/41) ([djdefi](https://github.com/djdefi))
- Remove unused packages ca-certificates and git [\#40](https://github.com/CachetHQ/Docker/pull/40) ([andygrunwald](https://github.com/andygrunwald))
- Removed "cachethq/docker:base-5a0320b" base image and replaced with debian:jessie [\#37](https://github.com/CachetHQ/Docker/pull/37) ([andygrunwald](https://github.com/andygrunwald))
- Remove CN language hack from Dockerfile [\#31](https://github.com/CachetHQ/Docker/pull/31) ([djdefi](https://github.com/djdefi))
- Add a CONTRIBUTING.md doc [\#28](https://github.com/CachetHQ/Docker/pull/28) ([djdefi](https://github.com/djdefi))

## [v2.0.4](https://github.com/CachetHQ/Docker/tree/v2.0.4) (2015-12-28)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.0.3...v2.0.4)

## [v2.0.3](https://github.com/CachetHQ/Docker/tree/v2.0.3) (2015-12-28)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.0.2...v2.0.3)

**Implemented enhancements:**

- Add GD extension [\#18](https://github.com/CachetHQ/Docker/issues/18)

**Closed issues:**

- Errors in README.md [\#23](https://github.com/CachetHQ/Docker/issues/23)

**Merged pull requests:**

- Fix README based on \#23 [\#24](https://github.com/CachetHQ/Docker/pull/24) ([djdefi](https://github.com/djdefi))
- Use upstream cachet master [\#21](https://github.com/CachetHQ/Docker/pull/21) ([djdefi](https://github.com/djdefi))

## [v2.0.2](https://github.com/CachetHQ/Docker/tree/v2.0.2) (2015-12-06)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.0.1...v2.0.2)

## [v2.0.1](https://github.com/CachetHQ/Docker/tree/v2.0.1) (2015-12-06)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.0.0...v2.0.1)

## [v2.0.0](https://github.com/CachetHQ/Docker/tree/v2.0.0) (2015-12-06)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/base-5a0320b...v2.0.0)

## [base-5a0320b](https://github.com/CachetHQ/Docker/tree/base-5a0320b) (2015-12-06)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.0.0-beta1...base-5a0320b)

**Implemented enhancements:**

- Add php-gd to address \#18 [\#20](https://github.com/CachetHQ/Docker/pull/20) ([djdefi](https://github.com/djdefi))

## [v2.0.0-beta1](https://github.com/CachetHQ/Docker/tree/v2.0.0-beta1) (2015-11-16)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v1.2.1...v2.0.0-beta1)

**Merged pull requests:**

- Cachet 1.2.1 [\#17](https://github.com/CachetHQ/Docker/pull/17) ([djdefi](https://github.com/djdefi))

## [v1.2.1](https://github.com/CachetHQ/Docker/tree/v1.2.1) (2015-11-16)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/v1.2.0...v1.2.1)

**Implemented enhancements:**

- Switch to PostgreSQL [\#2](https://github.com/CachetHQ/Docker/issues/2)
- Switch docker-compose.yml to use pgsql [\#11](https://github.com/CachetHQ/Docker/pull/11) ([djdefi](https://github.com/djdefi))

**Merged pull requests:**

- Fix file permission for .env file [\#16](https://github.com/CachetHQ/Docker/pull/16) ([andygrunwald](https://github.com/andygrunwald))

## [v1.2.0](https://github.com/CachetHQ/Docker/tree/v1.2.0) (2015-08-28)
[Full Changelog](https://github.com/CachetHQ/Docker/compare/base-d3506c1...v1.2.0)

**Implemented enhancements:**

- Base image layer optimization [\#10](https://github.com/CachetHQ/Docker/issues/10)

**Closed issues:**

- Delete 1.1 tag [\#8](https://github.com/CachetHQ/Docker/issues/8)
- Tracking of docker-hub automated build changes [\#7](https://github.com/CachetHQ/Docker/issues/7)
- Create a Base image [\#4](https://github.com/CachetHQ/Docker/issues/4)
- Design considerations [\#1](https://github.com/CachetHQ/Docker/issues/1)

**Merged pull requests:**

- move entrypoint COPY step down below the cachet setup [\#12](https://github.com/CachetHQ/Docker/pull/12) ([djdefi](https://github.com/djdefi))
- \[Test Needed\] 1.2 [\#6](https://github.com/CachetHQ/Docker/pull/6) ([wfjsw](https://github.com/wfjsw))
- Base Image [\#5](https://github.com/CachetHQ/Docker/pull/5) ([wfjsw](https://github.com/wfjsw))

## [base-d3506c1](https://github.com/CachetHQ/Docker/tree/base-d3506c1) (2015-08-15)


\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*