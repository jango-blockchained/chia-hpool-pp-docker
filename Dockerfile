# syntax=docker/dockerfile:1
FROM ubuntu:20.04 as build
RUN apt-get update && apt-get install -y \
  curl \
  unzip \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /tmp/hpool
RUN curl -L -o hpool-miner.zip https://github.com/hpool-dev/chia-miner/releases/download/v1.4.0-2/HPool-Miner-chia-v1.4.0-2-linux.zip
RUN unzip hpool-miner.zip

FROM ubuntu:20.04
WORKDIR /hpool
COPY --from=build /tmp/hpool/linux/hpool-miner-chia /hpool/hpool-miner-chia
CMD ["./hpool-miner-chia"]
