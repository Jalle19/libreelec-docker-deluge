# libreelec-docker-deluge

[![Build Status](https://travis-ci.org/Jalle19/libreelec-docker-deluge.svg?branch=master)](https://travis-ci.org/Jalle19/libreelec-docker-deluge)

Deluge for LibreELEC using Docker and systemd

### Comparison with other Deluge images

* Doesn't compile some Deluge dependencies from source, resulting in drastically faster build times
* Same filesystem layout inside the container, meaning you can move a newly downloaded torrent to your library and 
continue seeding it. `/var/media` is mounted too so you can use symlinks to your other harddrives in `/storage`.
* The daemon accepts remote connections so you can use the GTK UI to manage Deluge
* Listen port exposed so you can become connectable
* Sane defaults for a good out of the box experience, you don't need to change anything unless you want to

## Requirements

* LibreELEC with the Docker addon installed

## Installation

### Building the image

* Download this repository as a ZIP file using 
`wget https://github.com/Jalle19/libreelec-docker-deluge/archive/master.zip -O libreelec-docker-deluge.zip`
* Unzip the contents using `unzip libreelec-docker-deluge.zip`, then run `cd libreelec-docker-deluge-master`
* Build the Docker image using `./build.sh` (this will take about 5-10 minutes on your average Intel 
Celeron)
* Verify that the image got built by running `docker images | grep jalle19/libreelec-deluge`. You should see one 
tagged version and one "latest".

### Enabling the service

* Run `systemctl enable /storage/libreelec-docker-deluge-master/deluge/deluge.service` to enable the service. 
If you make changes to this file later on you must also run `systemctl daemon-reload` for the changes to take effect.
* Reboot or run `systemctl start deluge` to start the service

## Settings

* The web interface is available on port 8112. The password to the interface is `deluge`.
* The daemon is listening for remote UI connections on port 58846. If you want to use the GTK UI to connect to the 
daemon you will have to create an additional user in Deluge. To do this, open `/storage/deluge/config/auth` and add a 
new line. See the Deluge documentation on how this file works.
* Port 53160 (both TCP and UDP) is forwarded to the container so you can use port forwarding to become connectable

### Customizing

If the setup doesn't suit your needs, just modify whatever you have to and follow the steps from the `Installation` 
section to rebuild the image and update the service.

## Change log

See [CHANGELOG.md](CHANGELOG.md)

## License

GNU General Public License 2.0
