# Docker container for VLC
[![Release](https://img.shields.io/github/release/jlesage/docker-vlc.svg?logo=github&style=for-the-badge)](https://github.com/jlesage/docker-vlc/releases/latest)
[![Docker Image Size](https://img.shields.io/docker/image-size/jlesage/vlc/latest?logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/vlc/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/jlesage/vlc?label=Pulls&logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/vlc)
[![Docker Stars](https://img.shields.io/docker/stars/jlesage/vlc?label=Stars&logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/vlc)
[![Build Status](https://img.shields.io/github/actions/workflow/status/jlesage/docker-vlc/build-image.yml?logo=github&branch=master&style=for-the-badge)](https://github.com/jlesage/docker-vlc/actions/workflows/build-image.yml)
[![Source](https://img.shields.io/badge/Source-GitHub-blue?logo=github&style=for-the-badge)](https://github.com/jlesage/docker-vlc)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg?style=for-the-badge)](https://paypal.me/JocelynLeSage)

This is a Docker container for [VLC](https://www.videolan.org).

The graphical user interface (GUI) of the application can be accessed through a
modern web browser, requiring no installation or configuration on the client

> This Docker container is entirely unofficial and not made by the creators of VLC.

---

[![VLC logo](https://images.weserv.nl/?url=raw.githubusercontent.com/jlesage/docker-templates/master/jlesage/images/vlc-icon.png&w=110)](https://www.videolan.org)[![VLC](https://images.placeholders.dev/?width=96&height=110&fontFamily=monospace&fontWeight=400&fontSize=52&text=VLC&bgColor=rgba(0,0,0,0.0)&textColor=rgba(121,121,121,1))](https://www.videolan.org)

VLC is a free and open source cross-platform multimedia player and framework that
plays most multimedia files as well as DVDs, Audio CDs, VCDs, and various streaming
protocols.

---

## Quick Start

**NOTE**:
    The Docker command provided in this quick start is an example, and parameters
    should be adjusted to suit your needs.

Launch the VLC docker container with the following command:
```shell
docker run -d \
    --name=vlc \
    -p 5800:5800 \
    -v /docker/appdata/vlc:/config:rw \
    -v /home/user:/storage:ro \
    jlesage/vlc
```

Where:

  - `/docker/appdata/vlc`: Stores the application's configuration, state, logs, and any files requiring persistency.
  - `/home/user`: Contains files from the host that need to be accessible to the application.

Access the VLC GUI by browsing to `http://your-host-ip:5800`.
Files from the host appear under the `/storage` folder in the container.

## Documentation

Full documentation is available at https://github.com/jlesage/docker-vlc.

## Support or Contact

Having troubles with the container or have questions? Please
[create a new issue](https://github.com/jlesage/docker-vlc/issues).

For other Dockerized applications, visit https://jlesage.github.io/docker-apps.
