# Fleet Docker Deployment for Defcon30 Workshop

A quick and easy method for creating a production ready FleetDM environment using only Docker Compose. 

## Prerequisites

- Docker and Docker Compose
- fleetctl installed with Node or downloaded from https://github.com/fleetdm/fleet/releases/latest

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

## Running Fleet

- Start docker
- Clone this repository
- cd in to fleet-docker
- switch to defcon branch
- run "docker compose up"

- Fleet is now accessible at `fleet.traefik.me`
- Follow the instructions to set up Fleet. 

- Go to **Hosts**
- click "Add hosts"
- Select the correct platform for the host you're enrolling
- Copy the command
- Run the command command with `--insecure` flag to prevent error when using self-signed certificate:

```
fleetctl package --type=deb --fleet-desktop --fleet-url=https://fleet.traefik.me --enroll-secret=totallysecuresecret --insecure
```
- Run generated package on the host. 
- Once you have your host(s) enrolled, you can begin querying your hosts in the Fleet UI at `fleet.traefik.me/queries/manage`!

>  If you're enrolling multiple hosts, you can use the same installer package to enroll all hosts for a given platform. You can use network storage or copy the package to each host you'd like to install and run it. 
