ARG FEDORA_MAJOR_VERSION=38

# See https://pagure.io/releng/issue/11047 for final location
FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}

COPY etc /etc
COPY usr /usr

RUN rpm-ostree override remove \
    firefox firefox-langpacks \
    gnome-software-rpm-ostree

RUN rpm-ostree install \
    ansible \
    distrobox \
    firmware-manager \
    globalprotect-openconnect \
    langpacks-tr \
    libgda libgda-sqlite \
    moby-engine \
    openssl \
    python3-psutil \
    system76-driver \
    system76-firmware \
    system76-keyboard-configurator

RUN systemctl enable system76-firmware-daemon \
    && systemctl enable rpm-ostreed-automatic.timer \
    && systemctl enable flatpak-system-update.timer \
    && systemctl --global enable flatpak-user-update.timer

RUN rpm-ostree cleanup -m \
    && ostree container commit
