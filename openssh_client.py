#!/usr/bin/env python3
import paramiko
import logging
import warnings
# suppress warning and logs for paramiko
warnings.filterwarnings(action='ignore',module='.*paramiko.*')
logging.getLogger("paramiko").setLevel(logging.CRITICAL)
try:
    ssh = paramiko.SSHClient()
    ssh.load_host_keys("/root/.ssh/known_hosts")
    ssh.connect("localhost", port=8080, username="root", timeout=1, banner_timeout=1, auth_timeout=1)
    ssh.exec_command("exit", timeout=5)
    ssh.close()
except Exception as err:
    # log.error(f"{err}")
    exit(-1)
else:
    exit(0)