# Fleet Docker Deployment

A quick and easy method for creating a production ready FleetDM environment using only Docker Compose. 

## Prerequisites

- Docker desktop
- Node
- fleetctl

## Services

- Fleet 
- MySQL - Database for Fleet
- Redis - Caching server for Fleet
- traefik - Proxy server and TLS endpoint
- filebeat - Log shipper

## Additional tools

- traefik.me - Handles DNS resolution and SSL Certificates
- Graylog - Logging destination for filebeat

## Configuration Files

All services configured using the `default.env` or `service.yml` file located in the service folder. 

## Data persistence

All data is stored on the host machine in the folder for the service it is associate with. Data will persist after restart
as long as the local folder is not deleted. Can be changed in docker-compose.yml by removing volume links. 



## Usage

- Start docker
- Clone this repository
- cd in to fleet-docker
- switch to defcon branch
- run "docker compose up"
- Fleet is now accessible at `fleet.traefik.me`
- Set up user and org
- Go to Hosts
- Add hosts
- Select correct os
- Copy command
- Run with `--insecure`
- Run generated package