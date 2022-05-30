# Fleet Docker Deployment

A quick and easy method for creating a production ready FleetDM environment using only Docker Compose. 

## Services

- MySQL
- Redis
- Fleet

## Configuration Files

All services configured using the `default.env` file included in the folder for that service. 

## Fleet configuration details

Bare bones version of fleet with filesystem logging options. 

## Data persistence

All data is stored on the host machine in the folder for the service it is associate with. Data will persist after restart
as long as the local folder is not deleted. Can be changed in docker-compose.yml


## Usage

- Clone this repository
- Move to desired location
- From root of repo, run "docker compose up"

Please make sure to edit `fleet/default.env` and `mysql/default.env` and replace the example passwords with secure ones. Especially if you intend to make your instance publicly available.

## TLS

This repository includes two basic examples on how to enable TLS based on `traefik`.

In order to be able to expose the installation, please make sure that:
- The ports `80` and `443` are open / reachable
- A `DNS` entry exists that points to your host

### Standalone setup

This approach includes a `traefik` container with the required configuration in the docker-compose file `docker-compose-standalone.yml`.

To create a TLS based instance of fleet, a few steps are required:
```bash
# Create required directories
mkdir fleet/{logs,vulndb} mysql/data
# Fix permissions
sudo chmod -R o+w fleet/{logs,vulndb} mysql/data
chmod 600 config/ACME/acme.json
# Create the docker network for the edge router
docker network create traefik_proxy
# Edit the docker-compose file and replace `fleet.example.com` with the DNS record that targets your host
nano -w docker-compose-traefik-standalone.yml
# Edit the traefik config file and replace `email@example.com` with your email address
nano -w config/traefik.toml
# Launch the instance
docker-compose -f docker-compose-traefik-standalone.yml up -d --force-recreate && docker-compose -f docker-compose-traefik-standalone.yml logs -f
```

### External traefik stack

It is the recommended procedure to run `traefik` in a separate `docker-compose` stack. This way, multiple `docker-compose` projects can share a common `traefik` edge router.

Feel free to get inspired by this example repository for the `traefik` stack: https://github.com/cbirkenbeul/docker-homelab/tree/master/compose-files/applications/traefik

Once your `traefik` instance is up and running, there are only a few steps required to deploy `fleet`:
```bash
# Create required directories
mkdir fleet/{logs,vulndb} mysql/data
# Fix permissions
sudo chmod -R o+w fleet/{logs,vulndb} mysql/data
# Edit the docker-compose file and replace `fleet.example.com` with the DNS record that targets your host
nano -w docker-compose-traefik.yml
# Launch the instance
docker-compose -f docker-compose-traefik.yml up -d --force-recreate && docker-compose -f docker-compose-traefik.yml logs -f
```