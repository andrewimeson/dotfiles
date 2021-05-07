# Starts the SSH agent on shell login in case it hasn't already been started by
# a previous session. This is because the behavior got borked in macOS Sierra
# See `man ssh-add`, `man ssh-agent`, and https://github.com/lionheart/openradar-mirror/issues/15361
# for more details

# killall is cheaper than other options for checking if a process is running 
# This version doesn't work with the brew version of ssh-agent, commenting out

# TODO: this can probably be removed and reworked to use the native options for
# Keychain. I don't know that I even need to use the brew version of OpenSSH
# anymore

# if killall -0 ssh-agent; then
# 	return 0 #ssh-agent already running, do nothing
# else
# 	ssh-add -K ~/.ssh/id_rsa && echo "ran 'ssh-add'"
# fi


