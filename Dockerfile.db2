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

ARG VERSION_PIMO=v1.12.1
ARG VERSION_LINO=v2.0.1
ARG VERSION_MC=RELEASE.2021-12-10T00-14-28Z
ARG VERSION_DEBIAN=stable-20211220-slim

FROM cgifr/pimo:${VERSION_PIMO} AS pimo

FROM cgifr/lino:${VERSION_LINO} AS lino

FROM minio/mc:${VERSION_MC} as mc

FROM debian:${VERSION_DEBIAN}


RUN apt-get update && \
    apt-get install -y --no-install-recommends less jq wget git libxml2-dev netcat pv && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -r /var/cache/* /var/lib/apt/lists/*

ARG VERSION_MILLER=6.0.0
ADD https://github.com/johnkerl/miller/releases/download/v${VERSION_MILLER}/miller_${VERSION_MILLER}_linux_amd64.tar.gz /usr/bin/mlr
RUN chmod +x /usr/bin/mlr

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
