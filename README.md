# Jiho's script zoo

### run script
'''
bash <(wget -qO- [Script URL])

# example
bash <(wget -qO- https://raw.githubusercontent.com/2jiho/script/main/init_ubuntu.sh)
'''

### ssh connection with password and execute command
''' 
with sudo
sshpass -p $PASSWOED ssh -t user@address -o StrictHostKeyChecking=no "sudo -S <<< $PASSWORD hostname; sudo $CMD"

without sudo
sshpass -p $PASSWOED ssh -t user@address -o StrictHostKeyChecking=no "$CMD"
'''
