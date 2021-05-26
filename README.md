# hpool-docker

Run the hpool chia miner in a Docker container

## Configuration

You need to change the `config.yaml`

Modify these keys:

```yaml
minerName: <name-of-your-miner>
apiKey: <apiKey>
```

Set the `minerName` to a string which will be the string you find in the [Online Miner](https://www.hpool.com/center/machine) page at [hpool website](https://www.hpool.com/)

The `apiKey` is obviously your api key. :)

You can keep the `path` as is, just make sure you specify your local path in the `docker-compose.yaml` file. You need to edit this line and make sure that the `/local/plots` is where you have your plots locally. If you change where it is mounted inside the docker container (`/mnt/plots`) you also need to update this in the `config.yaml` fie. This folder will be mounted read-only.

```yaml
- /local/plots:/mnt/plots:ro
```

## Software needed

[Docker](https://docs.docker.com/get-docker/) and [docker-compose](https://github.com/docker/compose).

I have only tested this on Linux. If you get it to work with Windows or Mac please let me know!

## Running

To start the mining you need to run the container with the following command:

```bash
docker-compose up --build -d
```

This will build the docker image from the `Dockerfile` and it will start hpool chia miner.

To check logs you can use the `logs` command:

```bash
docker-compose logs -f
```

And to stop it:

```bash
docker-compose stop
```
