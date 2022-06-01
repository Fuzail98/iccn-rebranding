import paramiko
import getpass
import time

sshcli = paramiko.SSHClient()
sshcli.load_system_host_keys()
sshcli.set_missing_host_key_policy(paramiko.AutoAddPolicy())

ipaddr = input('Enter the IP address of the host: ')
usrnm = input('Enter user with root privileges: ')
pswd = getpass.getpass('Enter the root password: ')

print(f'Connecting to {ipaddr}...')
sshcli.connect(hostname=ipaddr, port=22, username='root', password=pswd, look_for_keys=False, allow_agent=False)

shell = sshcli.invoke_shell()
print('Connected!!!')
shell.send('8' + '\n')
time.sleep(1)
tmp = shell.recv(10000)
print('\n')

# Checking if git package is installed and install it if it isn't

shell.send(f'pkg info git' + '\n')
time.sleep(2)
out = shell.recv(10000)
if "pkg: No package(s) matching git" in out.decode():
    shell.send('pkg install git' + '\n')
    time.sleep(2)
    shell.send('y' + '\n')
    time.sleep(2)
    print('git has been installed!')
else:
    print('git already installed')

with open('commands.txt') as f:
    commands = f.read().splitlines()

print(f'Changes taking place on {ipaddr}, Please wait...')
for cmnd in commands:
    # print(f'Sending command: {cmnd}')
    shell.send(cmnd + '\n')
    time.sleep(2)

out1 = shell.recv(10000)

print('#' * 100)

shell.send('ls /usr/local/opnsense/www/themes/tukan/build/images/' + '\n')
time.sleep(2)
output1 = shell.recv(10000)
# print(output1.decode())

if 'iccn' in output1.decode():
    print('Changes have been changed! Please refresh your GUI and/or clear the cache on your browser.')
else:
    print("Changes haven't been made!!! Please try again.")

if sshcli.get_transport().is_active():
    print('Closing connection...')
    sshcli.close()
