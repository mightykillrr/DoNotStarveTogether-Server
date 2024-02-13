# Dockerfile for Don't Starve Together Server

This repository contains `Dockerfile` for running a Don't Starve Together (DST) server using Docker. 

- Server instructions were taken from [Dedicated Server Quick Setup Guide - Linux](https://forums.kleientertainment.com/forums/topic/64441-dedicated-server-quick-setup-guide-linux/).
- SteamCMD was built using [SteamCMD's Dockerfile](https://github.com/CM2Walki/steamcmd)

## Prerequisites

Before running the DST server, make sure you have the following installed:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Initialise a Server

```bash
docker run -d --name dst-server \
  -v dstGame:/home/steam \
  -v $(pwd)/serverData/:/home/steam/.klei/DoNotStarveTogether/MyDediServer/ \
  -p 10889:10889 \
  docker.io/mightykiller/dst-dedicated-server:latest
```

## Sample `compose.yml`

```yml
services:
  dst:
    image: docker.io/mightykiller/dst-dedicated-server:latest
    volumes:
      - dstGame:/home/steam
      - ./serverData/:/home/steam/.klei/DoNotStarveTogether/MyDediServer/
    ports:
      - "10889:10889/tcp"
volumes:
  dstGame:
```

## Notes

- The game is installed under `/home/steam/dontstarvetogether_dedicated_server`
- To add mods to your server, add another volume linking to `/home/steam/dontstarvetogether_dedicated_server/mods/` and edit the file accordingly.
  - `./mods/:/home/steam/dontstarvetogether_dedicated_server/mods/`
  - Check [this](https://youtu.be/2xrIE9ePpag?t=193) video to get an idea about mods.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
