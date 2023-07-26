<div align="center">
  <a href="https://github.com/illacloud/build-all-in-one-image">
    <img alt="ILLA Design Logo" width="120px" height="120px" src="https://github.com/illacloud/.github/blob/main/assets/images/illa-logo.svg"/>
  </a>
</div>

<h1 align="center"><a href="https://github.com/illacloud/build-all-in-one-image">Build All-in-One Image</a> </h1>

<p align="center">Build illa-builder all-in-one image by type ```make build```</p>


<p align="center">
  <a href="https://discord.gg/illacloud"><img src="https://img.shields.io/badge/chat-Discord-7289DA?logo=discord" height=18></a>
  <a href="https://twitter.com/illacloudHQ"><img src="https://img.shields.io/badge/Twitter-1DA1F2?logo=twitter&logoColor=white" height=18></a>
  <a href="https://github.com/orgs/illacloud/discussions"><img src="https://img.shields.io/badge/discussions-GitHub-333333?logo=github" height=18></a>
  <a href="./LICENSE"><img src="https://img.shields.io/github/license/illacloud/illa-builder" height=18></a>
</p>


# How to Build Image

It's very simple, just clone this repo:

(this tutorial base on ubuntu 20.04 or later release version)

```
git clone https://github.com/illacloud/build-all-in-one-image.git
```

and into repo folder:


```
cd build-all-in-one-image
```

and install gnu make:

```
apt install make
```

and if you have no docker installed, please run:

```
bash ./utils/reinstall-docker-with-ubuntu.sh
```

and build it:

```
make build
```

that's all.

# Docker Image Config

## Port Listening in Container

The port listening in container is ```2022```

## mount points

The mount points are:

- /opt/illa/database 
- /opt/illa/drive 
