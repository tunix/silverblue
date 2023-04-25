# silverblue

Stores code for building immutable OCI image base of Fedora Silverblue

## Usage

* Download and install [Fedora Silverblue](https://silverblue.fedoraproject.org/download).
* After you reboot, you should [pin the working deployment](https://docs.fedoraproject.org/en-US/fedora-silverblue/faq/#_about_using_fedora_silverblue) so you can safely rollback.
* Open a terminal and rebase the OS to this image:

```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/tunix/silverblue-base:latest
```

* Reboot the system and you're done!
* To revert back:

```
sudo rpm-ostree rebase fedora:fedora/38/x86_64/silverblue
```

* You can prefer between different tags:

  * 38
  * 37
  * latest
  * stable
  * a date like this: 20230131

### Credits

Thanks to [@castrojo](https://github.com/castrojo) for his awesome work!
