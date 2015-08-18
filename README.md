# Intrusion Detection Systems (IDS)
## Splashed with Docker Goodness

### Requirements
* docker-compose

### Configuration
This setup puts the IDS/IPS related systesm into host networking mode.

In docker-compse.yml:
  - INTERFACE: {tap interface name on host}

It is recommended you set your tap interface to manual. E.g.:
```
auto eth1
iface eth1 inet manual
up ifconfig eth1 up
```
### Build
#### Base Image
``` docker build -t themistymay/ubuntu:java8 java/ ```

#### Stack
``` docker-compose up ```

### THANKS
Thanks go out to quite a few people for each component is based on other projects. I'll snag a list and give credit where credit is due.
* @jasonish: https://github.com/jasonish/docker-suricata-elk
* @deviantony: https://github.com/deviantony/docker-elk
* Java install: http://askubuntu.com/questions/536134/install-specific-java-version-for-12-04/536161#536161
