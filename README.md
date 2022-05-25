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

## TODO

- Add TLS