# syntax=docker/dockerfile:1
FROM ubuntu:20.04 as build
RUN apt-get update && apt-get install -y \
  curl \
  unzip \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /tmp/hpool
RUN curl -L -o hpool-miner-pp.zip https://github.com/hpool-dev/chiapp-miner/releases/download/v1.5.0/HPool-Miner-chia-pp-v1.5.0-2-linux.zip
RUN unzip hpool-miner-pp.zip

FROM ubuntu:20.04
WORKDIR /hpool
COPY --from=build /tmp/hpool/linux/hpool-miner-chia-pp /hpool/hpool-miner-chia-pp
CMD ["./hpool-miner-chia-pp"]
