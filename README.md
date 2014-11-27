# Monit Base Dockerfile


This repository contains **Dockerfile** of [Ubuntu](http://www.ubuntu.com/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/czerasz/monit-base/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

Analysing the `Dockerfile` one can get an overview how to install Monit from source.

The image can be useful for debugging Monit configurations in a clean environment.

## Base Docker Image

* [czerasz/base:latest](https://registry.hub.docker.com/u/czerasz/base/)

## Installation

1. Install [Docker](https://www.docker.com/)

2. Download [automated build](https://registry.hub.docker.com/u/czerasz/monit-base/) from public [Docker Hub Registry](https://registry.hub.docker.com/):

        docker pull czerasz/monit-base

    Alternatively, you can build an image from Dockerfile:

        docker build -t="czerasz/monit-base" github.com/czerasz/docker-monit-base

## Usage

    docker run -it --rm czerasz/monit-base