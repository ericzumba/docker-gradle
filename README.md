# docker-gradle

build it:

```sh
make image
```

use it:

```sh
docker run --rm -v "$(YOUR_HOME_DIR)/.gradle/caches":/root/.gradle/caches -v $(YOUR_PROJECT_DIR):/project -i ericzumba/gradle:2-12 build
```
