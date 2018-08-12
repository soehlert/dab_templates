# Customized LXC templates for Proxmox
Using the Proxmox provided tool (Debian Appliance Builder - dab), this repo helps to create an LXC template for Proxmox. Currently, it helps build a Ubuntu 18.04 template ready for ansible by allowing ssh connections to root off the bat and installing python2.

### Install dab
In order to create this template, you need dab installed. Note: dab is only provided by Proxmox, not default repos. 

    apt update && apt install dab git make

### Clone repository

Once dab is installed just clone the git repository to get the required files.

    git clone https://github.com/soehlert/dab_templates.git
    cd dab_templates/

### Make changes to the configs

Feel free to customize the Makefile and dab.conf file if you want to add anything else. Currently this only:

* Allows SSH Root Login via password (probably not a good idea if your containers will be accesible via internet. Mine are not and also this gets shut off on first Ansible run.)
* Installs python2.7 so Ansible can run on first boot.
* localtime is set to America/Chicago (Makefile)
* locale is set to en_US.UTF-8 (Makefile)

If you require more information about the dab makefile please visit the Proxmox [dab wiki](https://pve.proxmox.com/wiki/Debian_Appliance_Builder), ask on the Proxmox [forum](https://forum.proxmox.com/) and check the dab man pages.

### Create template

To create the template, just run this from the root directory of the git repo

    make

Move the template to ```/var/lib/vz/template/cache/``` and change the name to something that makes sense to you. This will allow you to access this template from the WUI.

Clean up the directory after you've moved the template.

    make clean
