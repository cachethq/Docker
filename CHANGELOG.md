# Changelog

## [v2.3.17](https://github.com/CachetHQ/Docker/tree/v2.3.17) (2021-01-15)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.16...v2.3.17)

## [v2.3.16](https://github.com/CachetHQ/Docker/tree/v2.3.16) (2021-01-15)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.15...v2.3.16)

**Implemented enhancements:**

- Connect Redis with Cachet [\#261](https://github.com/CachetHQ/Docker/issues/261)
- Set production by default [\#363](https://github.com/CachetHQ/Docker/pull/363) ([djdefi](https://github.com/djdefi))
- Bump base nginx:alpine image [\#318](https://github.com/CachetHQ/Docker/pull/318) ([djdefi](https://github.com/djdefi))

**Closed issues:**

- ERROR:  relation "chq\_settings" does not exist at character 29 [\#366](https://github.com/CachetHQ/Docker/issues/366)
- Displaying a metric on the dashboard fails with error 500 code [\#365](https://github.com/CachetHQ/Docker/issues/365)
- Busybox sendmail does not support argument "b" [\#357](https://github.com/CachetHQ/Docker/issues/357)
- PHP 7.0 is EOL [\#353](https://github.com/CachetHQ/Docker/issues/353)
- FPM initialization failed [\#345](https://github.com/CachetHQ/Docker/issues/345)
- CSRF token validation failed error after 2.4 install [\#341](https://github.com/CachetHQ/Docker/issues/341)
- docker-compose config should be secure by default [\#337](https://github.com/CachetHQ/Docker/issues/337)
- CONNECT\_CR\_CERT:certificate verify failed [\#333](https://github.com/CachetHQ/Docker/issues/333)
- Third party with cachet docker-compose image [\#334](https://github.com/CachetHQ/Docker/issues/334)
- Errored [\#331](https://github.com/CachetHQ/Docker/issues/331)
- Is it possible to configure a docker instance of Cachet with admin account set up already [\#328](https://github.com/CachetHQ/Docker/issues/328)
- Cachet 2.4 - docker-compose [\#325](https://github.com/CachetHQ/Docker/issues/325)
- Session Issue while running through docker  [\#315](https://github.com/CachetHQ/Docker/issues/315)
- Fresh docker image pulled from cachethq/docker doesn't appear at all [\#312](https://github.com/CachetHQ/Docker/issues/312)
- Docker and Cachet version 2.3.14 QNAP container station [\#308](https://github.com/CachetHQ/Docker/issues/308)
- No supported encrypter found. The cipher and / or key length are invalid. Using Getting started with Docker Compose docs [\#330](https://github.com/CachetHQ/Docker/issues/330)
- Docker and Cachet version 2.3.15 [\#305](https://github.com/CachetHQ/Docker/issues/305)
- Building Development Environment Ubuntu 16.04 - Issue [\#296](https://github.com/CachetHQ/Docker/issues/296)
- Pages sending cookies are being cached leading to other users getting logged in [\#272](https://github.com/CachetHQ/Docker/issues/272)
- How about adding v2.4 images? [\#267](https://github.com/CachetHQ/Docker/issues/267)
- Mail subscriptions don't work [\#232](https://github.com/CachetHQ/Docker/issues/232)

**Merged pull requests:**

- start postfix at runtime if sendmail is used [\#390](https://github.com/CachetHQ/Docker/pull/390) ([Stunkymonkey](https://github.com/Stunkymonkey))
- add postfix to support sendmail command [\#388](https://github.com/CachetHQ/Docker/pull/388) ([Stunkymonkey](https://github.com/Stunkymonkey))
- Use 10.4 mariadb version tag [\#372](https://github.com/CachetHQ/Docker/pull/372) ([djdefi](https://github.com/djdefi))
- Use upstream curl image [\#371](https://github.com/CachetHQ/Docker/pull/371) ([J0WI](https://github.com/J0WI))
- Bump alpine nginx [\#364](https://github.com/CachetHQ/Docker/pull/364) ([djdefi](https://github.com/djdefi))
- Bump database container versions [\#360](https://github.com/CachetHQ/Docker/pull/360) ([djdefi](https://github.com/djdefi))
- Update composer version [\#359](https://github.com/CachetHQ/Docker/pull/359) ([djdefi](https://github.com/djdefi))
- Bump alpine version to 1.17.5-alpine [\#358](https://github.com/CachetHQ/Docker/pull/358) ([djdefi](https://github.com/djdefi))
- Fixed invalid default value for SESSION\_DOMAIN [\#354](https://github.com/CachetHQ/Docker/pull/354) ([friek](https://github.com/friek))
- Listen on IPv6 interface in addition to IPv4 [\#340](https://github.com/CachetHQ/Docker/pull/340) ([DennisGlindhart](https://github.com/DennisGlindhart))
- set better security defaults in docker-compose.yml [\#338](https://github.com/CachetHQ/Docker/pull/338) ([lrstanley](https://github.com/lrstanley))
- Default to apc session driver [\#336](https://github.com/CachetHQ/Docker/pull/336) ([djdefi](https://github.com/djdefi))
- Fix config for version 2.4 [\#335](https://github.com/CachetHQ/Docker/pull/335) ([camilb](https://github.com/camilb))
- Hotfix: adjusting empty APP\_KEY validation [\#327](https://github.com/CachetHQ/Docker/pull/327) ([yurireeis](https://github.com/yurireeis))
- Updated the README to make the APP\_KEY instructions clearer [\#323](https://github.com/CachetHQ/Docker/pull/323) ([nickshears](https://github.com/nickshears))
- Added command to seed the DB [\#320](https://github.com/CachetHQ/Docker/pull/320) ([alexstojda](https://github.com/alexstojda))
- Deprecate MAINTAINER [\#319](https://github.com/CachetHQ/Docker/pull/319) ([djdefi](https://github.com/djdefi))
- added missing DB\_PREFIX variable support in .env [\#317](https://github.com/CachetHQ/Docker/pull/317) ([VeekeeFr](https://github.com/VeekeeFr))
- removed the --no-dev flag as it prevents the use of latest 2.4 Cachet [\#316](https://github.com/CachetHQ/Docker/pull/316) ([VeekeeFr](https://github.com/VeekeeFr))
- Fix typo in README [\#314](https://github.com/CachetHQ/Docker/pull/314) ([Pyker](https://github.com/Pyker))
- Remove caching logic from nginx-site.conf [\#311](https://github.com/CachetHQ/Docker/pull/311) ([michaelkaye](https://github.com/michaelkaye))

## [v2.3.15](https://github.com/CachetHQ/Docker/tree/v2.3.15) (2018-07-05)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.14...v2.3.15)

**Implemented enhancements:**

- Ignoring HTTPS APP\_URL [\#271](https://github.com/CachetHQ/Docker/issues/271)
- TRUSTED\_PROXIES env [\#299](https://github.com/CachetHQ/Docker/pull/299) ([djdefi](https://github.com/djdefi))
- Add variable to switch running migration [\#295](https://github.com/CachetHQ/Docker/pull/295) ([shuichiro-makigaki](https://github.com/shuichiro-makigaki))

**Fixed bugs:**

- .env file is missing APP\_KEY when using the `docker run` stanzas [\#303](https://github.com/CachetHQ/Docker/issues/303)

**Closed issues:**

- Error 500 - After upgrade [\#304](https://github.com/CachetHQ/Docker/issues/304)
- development.ERROR: RuntimeException: No supported encrypter found. The cipher and / or key length are invalid [\#298](https://github.com/CachetHQ/Docker/issues/298)
- docker-compose build fails @16/25 getting 404 when connecting to codeload.github.com [\#297](https://github.com/CachetHQ/Docker/issues/297)
- release v2.3.14 [\#292](https://github.com/CachetHQ/Docker/issues/292)

**Merged pull requests:**

- Make GitHub archive URL variable [\#300](https://github.com/CachetHQ/Docker/pull/300) ([shuichiro-makigaki](https://github.com/shuichiro-makigaki))
- little logic on release helping [\#293](https://github.com/CachetHQ/Docker/pull/293) ([djdefi](https://github.com/djdefi))

## [v2.3.14](https://github.com/CachetHQ/Docker/tree/v2.3.14) (2018-05-09)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.13...v2.3.14)

**Implemented enhancements:**

- Use wget instead of php to download [\#289](https://github.com/CachetHQ/Docker/pull/289) ([djdefi](https://github.com/djdefi))

**Fixed bugs:**

- Set less defaults in entrypoint [\#288](https://github.com/CachetHQ/Docker/pull/288) ([djdefi](https://github.com/djdefi))

**Closed issues:**

- Don't write custom defaults to the .env file [\#287](https://github.com/CachetHQ/Docker/issues/287)
- Build the docker-image beyond a proxy [\#286](https://github.com/CachetHQ/Docker/issues/286)
- sqlite backend directly from environment [\#282](https://github.com/CachetHQ/Docker/issues/282)
- Change Cachet Documentation [\#274](https://github.com/CachetHQ/Docker/issues/274)

**Merged pull requests:**

- added CI tests for sqlite [\#285](https://github.com/CachetHQ/Docker/pull/285) ([camandel](https://github.com/camandel))
- sqlite backend directly from environment [\#283](https://github.com/CachetHQ/Docker/pull/283) ([camandel](https://github.com/camandel))
- Install missing php7-fileinfo extension [\#281](https://github.com/CachetHQ/Docker/pull/281) ([nstapelbroek](https://github.com/nstapelbroek))
- Update local dev readme copy [\#280](https://github.com/CachetHQ/Docker/pull/280) ([djdefi](https://github.com/djdefi))
- Resolve missing simplexml support [\#279](https://github.com/CachetHQ/Docker/pull/279) ([DavidCarrington](https://github.com/DavidCarrington))
- Updated Nginx, Composer to latest version and removed external php repo [\#276](https://github.com/CachetHQ/Docker/pull/276) ([mthota15](https://github.com/mthota15))
- Make Cachet runnable under arbitrary OpenShift user [\#270](https://github.com/CachetHQ/Docker/pull/270) ([cit1zen](https://github.com/cit1zen))
- Fix variable for session domain in .env file [\#266](https://github.com/CachetHQ/Docker/pull/266) ([shuichiro-makigaki](https://github.com/shuichiro-makigaki))

## [v2.3.13](https://github.com/CachetHQ/Docker/tree/v2.3.13) (2018-01-29)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.12...v2.3.13)

**Implemented enhancements:**

- PHP 7 support [\#168](https://github.com/CachetHQ/Docker/issues/168)
- Drop sudo / improve layers [\#260](https://github.com/CachetHQ/Docker/pull/260) ([djdefi](https://github.com/djdefi))
- Make shellcheck happy [\#257](https://github.com/CachetHQ/Docker/pull/257) ([djdefi](https://github.com/djdefi))
- Enable session cookie [\#245](https://github.com/CachetHQ/Docker/pull/245) ([djdefi](https://github.com/djdefi))
- Sends Cachet error logs to stdout, so they are more visible [\#242](https://github.com/CachetHQ/Docker/pull/242) ([djdefi](https://github.com/djdefi))
- Show full APP\_KEY variable in entrypoint output [\#240](https://github.com/CachetHQ/Docker/pull/240) ([djdefi](https://github.com/djdefi))
- Add php7 redis package [\#234](https://github.com/CachetHQ/Docker/pull/234) ([djdefi](https://github.com/djdefi))
- Bump base image to nginx:1.13.2-alpine [\#217](https://github.com/CachetHQ/Docker/pull/217) ([djdefi](https://github.com/djdefi))

**Fixed bugs:**

- Disable nginx caching via environment variable? [\#219](https://github.com/CachetHQ/Docker/issues/219)
- Don't cache components URI [\#220](https://github.com/CachetHQ/Docker/pull/220) ([djdefi](https://github.com/djdefi))

**Closed issues:**

- Documentation on how to integrate Lets Encrypt/Certbot with Docker Image [\#269](https://github.com/CachetHQ/Docker/issues/269)
- Looping during docker-compose up with MySQL [\#265](https://github.com/CachetHQ/Docker/issues/265)
- Change to MySQL from PostgreSQL [\#263](https://github.com/CachetHQ/Docker/issues/263)
- Anyone even tried to test the image? [\#259](https://github.com/CachetHQ/Docker/issues/259)
- Update release helper to release from master [\#254](https://github.com/CachetHQ/Docker/issues/254)
- Cachet 2.3.13 dockerhub image [\#250](https://github.com/CachetHQ/Docker/issues/250)
- Subscribers Text Field Not Showing [\#244](https://github.com/CachetHQ/Docker/issues/244)
- Only getting HTTP 500 on docker image, no logs [\#237](https://github.com/CachetHQ/Docker/issues/237)
- 500 Error [\#236](https://github.com/CachetHQ/Docker/issues/236)
- Update Docker Image in DockerHub [\#235](https://github.com/CachetHQ/Docker/issues/235)
- Running docker-compose with image instead of build shows no page [\#233](https://github.com/CachetHQ/Docker/issues/233)
-  Version in "./docker-compose.yml" is unsupported [\#229](https://github.com/CachetHQ/Docker/issues/229)
- Error 500 [\#226](https://github.com/CachetHQ/Docker/issues/226)
- CRIT uncaptured python exception when using invalid mail provider config in Docker container [\#225](https://github.com/CachetHQ/Docker/issues/225)
- Internal Server Error on manually starting docker container for cachet [\#223](https://github.com/CachetHQ/Docker/issues/223)
- php7-redis is missing [\#221](https://github.com/CachetHQ/Docker/issues/221)
- Big error after first start [\#213](https://github.com/CachetHQ/Docker/issues/213)
- php-fpm entered FATAL state, too many start retries too quick [\#209](https://github.com/CachetHQ/Docker/issues/209)
- Docker-Compose Cachet Container Crashes on Start [\#201](https://github.com/CachetHQ/Docker/issues/201)
- Email Not Sending Out, Subscribe Button Missing [\#125](https://github.com/CachetHQ/Docker/issues/125)

**Merged pull requests:**

- Use file sessions driver by default [\#273](https://github.com/CachetHQ/Docker/pull/273) ([djdefi](https://github.com/djdefi))
- Run migration before starting up app [\#268](https://github.com/CachetHQ/Docker/pull/268) ([shuichiro-makigaki](https://github.com/shuichiro-makigaki))
- Create CODEOWNERS [\#256](https://github.com/CachetHQ/Docker/pull/256) ([djdefi](https://github.com/djdefi))
- Update release-helper.sh [\#255](https://github.com/CachetHQ/Docker/pull/255) ([djdefi](https://github.com/djdefi))
- Backport23 [\#252](https://github.com/CachetHQ/Docker/pull/252) ([djdefi](https://github.com/djdefi))
- Use explicit localhost IP in configs [\#246](https://github.com/CachetHQ/Docker/pull/246) ([djdefi](https://github.com/djdefi))
- Update Tagged Build Version to v2.3.12 [\#243](https://github.com/CachetHQ/Docker/pull/243) ([mightyfree](https://github.com/mightyfree))
- Note about app key [\#238](https://github.com/CachetHQ/Docker/pull/238) ([djdefi](https://github.com/djdefi))
- Bump base image 1.13.5-alpine [\#231](https://github.com/CachetHQ/Docker/pull/231) ([djdefi](https://github.com/djdefi))
- Fixing clone quick start step [\#230](https://github.com/CachetHQ/Docker/pull/230) ([NickBusey](https://github.com/NickBusey))
- Updated supervisord.conf [\#224](https://github.com/CachetHQ/Docker/pull/224) ([FalkW](https://github.com/FalkW))
- Force Linux line endings on entrypoint.sh [\#222](https://github.com/CachetHQ/Docker/pull/222) ([misenhower](https://github.com/misenhower))
- All vars used in `sed` commands wrapped in double quotes; [\#218](https://github.com/CachetHQ/Docker/pull/218) ([gcox](https://github.com/gcox))
- Add changelog generation step into release helper script [\#216](https://github.com/CachetHQ/Docker/pull/216) ([djdefi](https://github.com/djdefi))

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
- Update Nginx 1.12 [\#202](https://github.com/CachetHQ/Docker/pull/202) ([MRidwanKurniawan](https://github.com/MRidwanKurniawan))

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
- Unpin packages and make composer install better [\#113](https://github.com/CachetHQ/Docker/pull/113) ([djdefi](https://github.com/djdefi))
- Write-good suggestions [\#105](https://github.com/CachetHQ/Docker/pull/105) ([djdefi](https://github.com/djdefi))
- Update composer sha384 [\#104](https://github.com/CachetHQ/Docker/pull/104) ([atmosx](https://github.com/atmosx))
- Add BSD-3 clause license [\#101](https://github.com/CachetHQ/Docker/pull/101) ([djdefi](https://github.com/djdefi))
- Add testing info to readme. [\#100](https://github.com/CachetHQ/Docker/pull/100) ([djdefi](https://github.com/djdefi))
- fixes \#92 - adding postgres volume [\#99](https://github.com/CachetHQ/Docker/pull/99) ([djdefi](https://github.com/djdefi))
- Pin versions for all packages [\#98](https://github.com/CachetHQ/Docker/pull/98) ([djdefi](https://github.com/djdefi))
- Verify composer installer and version pin [\#97](https://github.com/CachetHQ/Docker/pull/97) ([djdefi](https://github.com/djdefi))

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
- Add api test [\#93](https://github.com/CachetHQ/Docker/pull/93) ([djdefi](https://github.com/djdefi))

**Closed issues:**

- Pinned package are not present anymore in debain repo [\#112](https://github.com/CachetHQ/Docker/issues/112)
- '/sbin/entrypoint.sh' not found or does not exist [\#109](https://github.com/CachetHQ/Docker/issues/109)
- Error 500 \(Components and Dashboard\) [\#107](https://github.com/CachetHQ/Docker/issues/107)
- HTTP 500 Error after Login [\#102](https://github.com/CachetHQ/Docker/issues/102)

**Merged pull requests:**

- Rel 2.3.0 [\#115](https://github.com/CachetHQ/Docker/pull/115) ([djdefi](https://github.com/djdefi))
- 2.3 backports [\#96](https://github.com/CachetHQ/Docker/pull/96) ([djdefi](https://github.com/djdefi))
- 2.3 backport to master [\#91](https://github.com/CachetHQ/Docker/pull/91) ([djdefi](https://github.com/djdefi))
- 2.3 backport [\#88](https://github.com/CachetHQ/Docker/pull/88) ([djdefi](https://github.com/djdefi))

## [v2.3.0-RC6](https://github.com/CachetHQ/Docker/tree/v2.3.0-RC6) (2016-06-16)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.2.4...v2.3.0-RC6)

**Merged pull requests:**

- Rel 2.3.0 rc6 [\#95](https://github.com/CachetHQ/Docker/pull/95) ([djdefi](https://github.com/djdefi))
- Add bats QA tests [\#90](https://github.com/CachetHQ/Docker/pull/90) ([djdefi](https://github.com/djdefi))
- Fix DB connect warning message [\#87](https://github.com/CachetHQ/Docker/pull/87) ([djdefi](https://github.com/djdefi))

## [v2.2.4](https://github.com/CachetHQ/Docker/tree/v2.2.4) (2016-06-16)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.2.3...v2.2.4)

**Merged pull requests:**

- Cachet v2.2.4 release [\#94](https://github.com/CachetHQ/Docker/pull/94) ([djdefi](https://github.com/djdefi))

## [v2.2.3](https://github.com/CachetHQ/Docker/tree/v2.2.3) (2016-06-06)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.3.0-RC2...v2.2.3)

**Implemented enhancements:**

- Rename docker directory [\#85](https://github.com/CachetHQ/Docker/issues/85)
- QA testing suite [\#83](https://github.com/CachetHQ/Docker/issues/83)

**Closed issues:**

- 2.3 Branch Needed [\#76](https://github.com/CachetHQ/Docker/issues/76)

## [v2.3.0-RC2](https://github.com/CachetHQ/Docker/tree/v2.3.0-RC2) (2016-05-27)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.2.2...v2.3.0-RC2)

**Merged pull requests:**

- 2.3 Image enhancements  [\#82](https://github.com/CachetHQ/Docker/pull/82) ([djdefi](https://github.com/djdefi))
- Use PgSQL default \(\#78\) \(\#79\) [\#80](https://github.com/CachetHQ/Docker/pull/80) ([djdefi](https://github.com/djdefi))
- Use PgSQL default [\#78](https://github.com/CachetHQ/Docker/pull/78) ([jbrooksuk](https://github.com/jbrooksuk))
- Don't generate key anymore [\#75](https://github.com/CachetHQ/Docker/pull/75) ([jbrooksuk](https://github.com/jbrooksuk))
- Add Travis CI support [\#73](https://github.com/CachetHQ/Docker/pull/73) ([djdefi](https://github.com/djdefi))
- Fix for APP\_KEY not being set in .env file [\#71](https://github.com/CachetHQ/Docker/pull/71) ([jamie-owen](https://github.com/jamie-owen))

## [v2.2.2](https://github.com/CachetHQ/Docker/tree/v2.2.2) (2016-05-24)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.2.1...v2.2.2)

**Closed issues:**

- Master broken`? [\#72](https://github.com/CachetHQ/Docker/issues/72)
- 500 error - Docker install [\#69](https://github.com/CachetHQ/Docker/issues/69)
- Error 500 after restart [\#68](https://github.com/CachetHQ/Docker/issues/68)
- Cachet doesnt start - Install loop [\#67](https://github.com/CachetHQ/Docker/issues/67)
- Errors 500 [\#66](https://github.com/CachetHQ/Docker/issues/66)

**Merged pull requests:**

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

- Fixes issue where .env file is invalid [\#61](https://github.com/CachetHQ/Docker/pull/61) ([adamlc](https://github.com/adamlc))
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

## [v2.0.2](https://github.com/CachetHQ/Docker/tree/v2.0.2) (2015-12-06)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.0.1...v2.0.2)

## [v2.0.1](https://github.com/CachetHQ/Docker/tree/v2.0.1) (2015-12-06)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.0.0...v2.0.1)

## [v2.0.0](https://github.com/CachetHQ/Docker/tree/v2.0.0) (2015-12-06)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/base-5a0320b...v2.0.0)

## [base-5a0320b](https://github.com/CachetHQ/Docker/tree/base-5a0320b) (2015-12-06)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v2.0.0-beta1...base-5a0320b)

**Merged pull requests:**

- Base Image [\#5](https://github.com/CachetHQ/Docker/pull/5) ([wfjsw](https://github.com/wfjsw))

## [v2.0.0-beta1](https://github.com/CachetHQ/Docker/tree/v2.0.0-beta1) (2015-11-16)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v1.2.1...v2.0.0-beta1)

**Merged pull requests:**

- Cachet 1.2.1 [\#17](https://github.com/CachetHQ/Docker/pull/17) ([djdefi](https://github.com/djdefi))

## [v1.2.1](https://github.com/CachetHQ/Docker/tree/v1.2.1) (2015-11-16)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/v1.2.0...v1.2.1)

**Implemented enhancements:**

- Switch to PostgreSQL [\#2](https://github.com/CachetHQ/Docker/issues/2)
- Add php-gd to address \#18 [\#20](https://github.com/CachetHQ/Docker/pull/20) ([djdefi](https://github.com/djdefi))
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

## [base-d3506c1](https://github.com/CachetHQ/Docker/tree/base-d3506c1) (2015-08-15)

[Full Changelog](https://github.com/CachetHQ/Docker/compare/0698357d2ce93f5b7ddc44901a2f7113f356ba6b...base-d3506c1)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
