# Kali Packer

Automated build of the recent version of kali

## Build
Build a new Kali OVA from ISO
```bash
packer build -only=virtualbox-iso kali-linux-amd64-desktop.json

```

Build an updated Kali OVA from OVA

```bash
packer build -only=virtualbox-ovf -var 'user=<username>' -var'pass=<your-pass>' kali-linux-upgrade.json

```

## Run

```bash
vagrant up
```
