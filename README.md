# libreelec-docker-deluge

Deluge for LibreELEC using Docker and systemd

## Requirements

* LibreELEC with the Docker addon installed

## Installation

### Building the image

* Download this repository as a ZIP file, then unpack it
* Run `./build.sh deluge x86_64` to build the Docker image. This will take about 5-10 minutes on your average Intel 
Celeron.
* Verify that the image got built by running `docker images | grep jalle19/libreelec-deluge`. You should see one 
tagged version and one "latest".

### Enabling the service


