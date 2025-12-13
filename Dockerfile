#
# vlc Dockerfile
#
# https://github.com/jlesage/docker-vlc
#

# Pull base image.
FROM jlesage/baseimage-gui:alpine-3.23-v4.10.3

# Docker image version is provided via build arg.
ARG DOCKER_IMAGE_VERSION=

# Define software versions.
ARG VLC_VERSION=3.0.21-r16

# Define working directory.
WORKDIR /tmp

# Install VLC.
RUN \
     add-pkg vlc-qt=${VLC_VERSION}

# Install extra packages.
RUN \
    ARCH="$(apk --print-arch)" && \
    if [ "$ARCH" = "x86" ] || [ "$ARCH" = "x86_64" ]; then \
        libva_intel_driver="libva-intel-driver"; \
    fi && \
    add-pkg \
        mesa-va-gallium \
        $libva_intel_driver \
        # A font is needed.
        font-dejavu \
        # For optical drive listing.
        lsscsi \
        && \
    true

# Generate and install favicons.
RUN \
    APP_ICON_URL=https://github.com/jlesage/docker-templates/raw/master/jlesage/images/vlc-icon.png && \
    install_app_icon.sh "$APP_ICON_URL"

# Add files.
COPY rootfs/ /

# Set internal environment variables.
RUN \
    set-cont-env APP_NAME "VLC" && \
    set-cont-env APP_VERSION "$VLC_VERSION" && \
    set-cont-env DOCKER_IMAGE_VERSION "$DOCKER_IMAGE_VERSION" && \
    true

# Define mountable directories.
VOLUME ["/storage"]

# Metadata.
LABEL \
      org.label-schema.name="vlc" \
      org.label-schema.description="Docker container for VLC" \
      org.label-schema.version="${DOCKER_IMAGE_VERSION:-unknown}" \
      org.label-schema.vcs-url="https://github.com/jlesage/docker-vlc" \
      org.label-schema.schema-version="1.0"
