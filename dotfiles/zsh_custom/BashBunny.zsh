# I needed to set the environment variable to update the Bash bunny using the
# supplied firemware update tool from Hak5. I'm guessing macOS security
# improvements broke this, which is hilarious

# https://forums.hak5.org/topic/50804-bashbunny-updater-needs-help-on-macos-catalina/

EXPECTED_LOCATION=/Volumes/BashBunny
if [[ -d $EXPECTED_LOCATION ]]; then
  export BUNNYPATH=$EXPECTED_LOCATION
fi
