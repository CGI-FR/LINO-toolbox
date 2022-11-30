# Copyright (C) 2021 CGI France
#
# This file is part of LINO.
#
# LINO is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# LINO is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with LINO.  If not, see <http:#www.gnu.org/licenses/>.

ARG VERSION_PIMO=v1.15.0
ARG VERSION_LINO=v2.2-db2
ARG VERSION_SIGO=0.3.0
ARG VERSION_MILLER=6.5.0
ARG VERSION_MC=RELEASE.2022-11-17T21-20-39Z
ARG VERSION_DEBIAN=stable-20221114-slim

FROM cgifr/pimo:${VERSION_PIMO} AS pimo

FROM cgifr/lino:${VERSION_LINO} AS lino

FROM minio/mc:${VERSION_MC} AS mc

FROM debian:${VERSION_DEBIAN}

ARG VERSION_MILLER
ARG VERSION_SIGO

RUN apt-get update && \
    apt-get install -y --no-install-recommends less jq wget git libxml2-dev pv && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -r /var/cache/* /var/lib/apt/lists/*

ADD https://github.com/johnkerl/miller/releases/download/v${VERSION_MILLER}/miller-${VERSION_MILLER}-linux-amd64.tar.gz /usr/bin/mlr
RUN chmod +x /usr/bin/mlr

ADD https://github.com/CGI-FR/SIGO/releases/download/v${VERSION_SIGO}/SIGO_${VERSION_SIGO}_linux_amd64.tar.gz /usr/bin/sigo
RUN chmod +x /usr/bin/sigo

ADD https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/ncat /usr/bin/nc
RUN chmod +x /usr/bin/nc

ENV DB2_HOME=/opt/db2/clidriver
ENV LD_LIBRARY_PATH=${DB2_HOME}/lib

ADD https://public.dhe.ibm.com/ibmdl/export/pub/software/data/db2/drivers/odbc_cli/linuxx64_odbc_cli.tar.gz /tmp/
RUN mkdir -p $(dirname ${DB2_HOME}) && \
    tar -xvzf /tmp/linuxx64_odbc_cli.tar.gz -C  $(dirname ${DB2_HOME}) && \
    rm /tmp/linuxx64_odbc_cli.tar.gz

COPY --from=pimo /usr/bin/pimo /usr/bin/pimo
COPY --from=lino /usr/bin/lino /usr/bin/lino
COPY --from=mc /usr/bin/mc /usr/bin/mc

WORKDIR /home/lino
