ARG FEDORA_MAJOR_VERSION=37

# See https://pagure.io/releng/issue/11047 for final location
FROM ghcr.io/cgwalters/fedora-silverblue:${FEDORA_MAJOR_VERSION}

COPY etc /etc

RUN rpm-ostree override remove firefox firefox-langpacks

RUN rpm-ostree install \
    ansible \
    firmware-manager \
    globalprotect-openconnect \
    langpacks-tr \
    moby-engine \
    openssl \
    python3-psutil \
    system76-driver \
    system76-firmware \
    system76-keyboard-configurator

RUN systemctl enable system76-firmware-daemon

RUN rpm-ostree cleanup -m \
    && ostree container commit
