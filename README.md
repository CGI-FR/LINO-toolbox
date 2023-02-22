# LINO Toolbox

LINO Toolbox is suite of Docker images with commands `lino`, `pimo`, `sigo`, `mlr`, `mc`, `jq` `wget` `git` `pv` .

## Usage

To get started with Lino Toolbox and Docker, you'll need to have Docker installed on your system. Once you've done that, you can use the following command to run Lino Toolbox with Docker:

```
docker run --rm -it  -v $(pwd):/workspace  cgifr/lino-toolbox:v1.0.0-debian
```

This command will start a Docker container with the cgifr/lino-toolbox:v1.0.0-debian image and mount the current working directory on your host machine to the /workspace directory in the container. Once the container finishes running, it will be automatically removed.

## debian image :
| Tool | Source  | Version |
|------|---------|---------|
|debian|docker hub|debian:stable-20221114-slim |
|lino  |docker hub|cgifr/lino:2.2 |
|pimo  |docker hub|cgifr/pimo:1.17.0 |
|sigo  |github   |0.3.0 |
|mlr   |github   |6.5.0 |
|mc    |docker hub|minio/mc:RELEASE.2022-11-17T21-20-39Z|
|jq    |debian   |- |
|wget  |debian   |- |
|git   |debian   |- |
|pv    |debian   |- |

## oracle image :
| Tool | Source  | Version |
|------|---------|---------|
|oracle|docker hub|ghcr.io/oracle/oraclelinux7-instantclient:19 |
|lino  |doker hub|cgifr/lino:2.2 |
|pimo  |docker hub|cgifr/pimo:1.17.0 |
|sigo  |github   |0.3.0 |
|mlr   |github   |6.5.0 |
|mc    |docker hub|minio/mc:RELEASE.2022-11-17T21-20-39Z|
|jq    |centos   |- |
|wget  |centos   |- |
|git   |centos   |- |
|pv    |centos   |- |