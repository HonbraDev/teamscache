GREEN='\033[0;32m'
NC='\033[0m'
echo " ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ "
echo " ┃ Microsoft Teams cache cleaner ┃ "
echo " ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ "
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo " ┃ Detected platform: GNU/Linux  ┃ "
  echo " ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ "
  rm -rf ~/.config/Microsoft/Microsoft\ Teams/Cache/
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo " ┃ Detected platform: macOS      ┃ "
  echo " ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ "
  rm -rf ~/Library/Application\ Support/Microsoft/Teams
else
  echo " ┃ Unsupported platform          ┃ "
  echo " ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ "
  read -s -n 1 -p "Press any key to continue . . ."
  echo
  exit
fi

echo -e "${GREEN}"
if [[ $1 == "--restart" ]]; then
  if [ "$(pgrep teams | wc -l)" -gt 1 ]; then
    killall teams
    sleep 2
    teams
  else
    echo Teams is not running.
  fi
  echo " ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ "
  echo " ┃             Done!             ┃ "
  echo " ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ "
else
  echo " ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ "
  echo " ┃ Done! You can open Teams again┃ "
  echo " ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ "
fi
echo -e "${NC}"

read -s -n 1 -p "Press any key to continue . . ."
echo

# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ Done! Restart Teams to finish ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
