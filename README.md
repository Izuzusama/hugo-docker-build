# Build hugo project via docker

Adapted from: <https://github.com/felicianotech/docker-hugo>

Hugo Version: 0.49.2

Docker Hub: <https://hub.docker.com/r/izuzu/hugo-docker-build/>

## Run

Change directory to hugo project and

`docker run -it --rm -v $(pwd):/app izuzu/hugo-docker-build`

The resulting project will be at `public` directory
