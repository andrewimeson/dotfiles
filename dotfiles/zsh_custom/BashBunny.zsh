# I needed to set the environment variable to update the Bash bunny using the
# supplied firmware update tool from Hak5. I'm guessing macOS security
# improvements broke this, which is hilarious

# https://forums.hak5.org/topic/50804-bashbunny-updater-needs-help-on-macos-catalina/

# Yay, anonymous functions!
() {
    local _EXPECTED_LOCATION=/Volumes/BashBunny
    if [[ -f $_EXPECTED_LOCATION ]]; then
        export BUNNYPATH=$_EXPECTED_LOCATION
    fi
}
