#/bin/bash
screen -dmS new_screen bash
screen -S new_screen -X stuff "echo \"test\"
"
screen -r new_screen
