ARG FEDORA_MAJOR_VERSION=38

# See https://pagure.io/releng/issue/11047 for final location
FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}

COPY etc /etc
COPY usr /usr

RUN rpm-ostree override remove \
    firefox firefox-langpacks \
    gnome-software-rpm-ostree

RUN rpm-ostree install \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

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
    system76-keyboard-configurator \
    intel-media-driver \
    kernel-devel-matched \
    libratbag-ratbagd \
    libva-intel-driver \
    libva-utils \
    mesa-va-drivers-freeworld \
    nvme-cli \
    nvtop \
    pipewire-codec-aptx \
    smartmontools \
    zstd \
    ffmpegthumbnailer

RUN systemctl enable system76-firmware-daemon \
    && systemctl enable rpm-ostreed-automatic.timer \
    && systemctl enable flatpak-system-update.timer \
    && systemctl --global enable flatpak-user-update.timer

RUN rpm-ostree cleanup -m \
    && ostree container commit
