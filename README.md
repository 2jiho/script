# Jiho's script zoo

### run script
```bash
bash <(wget -qO- https://sh.2jiho.com/)

# example
bash <(wget -qO- https://raw.githubusercontent.com/2jiho/script/main/init_ubuntu.sh)
```

### ssh connection with password and execute command
``` bash
# with sudo
sshpass -p $PASSWOED ssh -t user@address -o StrictHostKeyChecking=no "sudo -S <<< $PASSWORD hostname; sudo $CMD"

# without sudo
sshpass -p $PASSWOED ssh -t user@address -o StrictHostKeyChecking=no "hostname; $CMD"
```
