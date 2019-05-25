# Kali Packer

Currently builds and runs. There is an issue with the virtualbox guest additions not getting installed correctly.

## Build
```bash
packer build -only=virtualbox-iso kali-linux-2019-amd64-desktop.json

```

## Run

```bash
vagrant up
```

# TODO
* ~~Add image to Vagrantfile~~ Done
* ~~Fix virtualbox guest additions~~ Done