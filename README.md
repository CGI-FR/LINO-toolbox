# LINO Toolbox

LINO Toolbox is suite of Docker images with commands `lino`, `pimo`, `sigo`, `mimo`, `mlr`, `mc`, `jq`, `dsq`, `wget`, `git`, `pv`, `vim`, `dsq` .

## Usage

To get started with Lino Toolbox and Docker, you'll need to have Docker installed on your system. Once you've done that, you can use the following command to run Lino Toolbox with Docker:

```
docker run --rm -it  -v $(pwd):/workspace  cgifr/lino-toolbox:v2.1.0-debian
```

This command will start a Docker container with the cgifr/lino-toolbox:v1.4.0-debian image and mount the current working directory on your host machine to the /workspace directory in the container. Once the container finishes running, it will be automatically removed.

## debian image :
| Tool | Source  | Version |
|------|---------|---------|
|debian|docker hub|debian:stable-20230904-slim |
|lino  |docker hub|cgifr/lino:3.1.0 |
|pimo  |docker hub|cgifr/pimo:1.28.1 |
|sigo  |github   |0.4.0 |
|mimo  |github   |0.8.0 |
|mlr   |github   |6.13.0 |
|dsq   |github   |0.23.0 |
|mc    |docker hub|minio/mc:RELEASE.2023-09-07T22-48-55Z|
|jq    |debian   |- |
|wget  |debian   |- |
|git   |debian   |- |
|pv    |debian   |- |
|vim   |debian   |- |
|iputils-ping |debian   |- |
