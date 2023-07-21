# Jiho's script zoo

### run script
```bash
bash <(wget -qO- https://sh.2jiho.com/)
```

### ssh connection with password and execute command
``` bash
# with sudo
sshpass -p $PASSWOED ssh -t user@address -o StrictHostKeyChecking=no "sudo -S <<< $PASSWORD hostname; sudo $CMD"

# without sudo
sshpass -p $PASSWOED ssh -t user@address -o StrictHostKeyChecking=no "hostname; $CMD"
```
