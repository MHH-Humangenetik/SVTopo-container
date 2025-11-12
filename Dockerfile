ARG SVTOPO_VERSION=v0.3.0

FROM alpine/git:v2.49.1 AS source
ARG SVTOPO_VERSION
WORKDIR /
RUN git clone --depth 1 --branch $SVTOPO_VERSION https://github.com/PacificBiosciences/SVTopo.git

FROM rust:1.91.1-alpine3.22 AS rust-builder
RUN apk add --no-cache build-base clang-dev
ENV RUSTFLAGS="-C target-feature=-crt-static"
COPY --from=source /SVTopo /SVTopo
WORKDIR /SVTopo
RUN cargo install --locked --root /usr/local --path .

FROM python:3.10-alpine AS slim
RUN apk add --no-cache clang-dev musl-dev linux-headers g++ gcc zlib-dev make python3-dev jpeg-dev
COPY --from=rust-builder /usr/local/bin/svtopo /usr/local/bin/svtopo
COPY --from=source /SVTopo/SVTopoVz /SVTopoVz
WORKDIR /SVTopoVz
RUN pip install --no-cache-dir .
WORKDIR /

FROM slim AS nextflow
# install bash, awk, date, grep, ps, sed, tail, tee (https://nextflow.io/docs/latest/reports.html#execution-report-tasks)
RUN apk add --no-cache bash coreutils grep procps sed