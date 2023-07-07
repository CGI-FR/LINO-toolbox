# LINO Toolbox

LINO Toolbox is suite of Docker images with commands `lino`, `pimo`, `sigo`, `mlr`, `mc`, `jq` `wget` `git` `pv` .

## Usage

To get started with Lino Toolbox and Docker, you'll need to have Docker installed on your system. Once you've done that, you can use the following command to run Lino Toolbox with Docker:

```
docker run --rm -it  -v $(pwd):/workspace  cgifr/lino-toolbox:v1.1.0-debian
```

This command will start a Docker container with the cgifr/lino-toolbox:v1.1.0-debian image and mount the current working directory on your host machine to the /workspace directory in the container. Once the container finishes running, it will be automatically removed.

## debian image :
| Tool | Source  | Version |
|------|---------|---------|
|debian|docker hub|debian:stable-20230703-slim |
|lino  |docker hub|cgifr/lino:2.4.0 |
|pimo  |docker hub|cgifr/pimo:1.19.0 |
|sigo  |github   |0.3.0 |
|mlr   |github   |6.8.0 |
|mc    |docker hub|minio/mc:RELEASE.2023-07-07T05-25-51Z|
|jq    |debian   |- |
|wget  |debian   |- |
|git   |debian   |- |
|pv    |debian   |- |
