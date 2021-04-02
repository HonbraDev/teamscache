echo " ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ "
echo " ┃ Microsoft Teams cache cleaner ┃ "
echo " ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ "
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo " ┃ Detected platform: GNU/Linux  ┃ "
  echo " ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ "
  if [ "$(pgrep teams | wc -l)" -gt 1 ]; then
    echo " ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ "
    echo " ┃ Done! Restarting Teams...     ┃ "
    echo " ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ "
    killall teams
    sleep 2
    teams
  fi
  rm -rf ~/.config/Microsoft/Microsoft\ Teams/Cache/
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo " ┃ Detected platform: macOS      ┃ "
  echo " ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ "
  rm -rf ~/Library/Application\ Support/Microsoft/Teams
  if [ "$(pgrep Teams | wc -l)" -gt 1 ]; then
    echo " ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ "
    echo " ┃ Done! Restarting Teams...     ┃ "
    echo " ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ "
    killall Teams
    sleep 2
    open /Applications/Microsoft\ Teams.app
  fi
else
  echo " ┃ Unsupported platform          ┃ "
  echo " ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ "
  read -s -n 1 -p "Press any key to continue . . ."
  echo
  exit
fi

echo " ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ "
echo " ┃ Done!                         ┃ "
echo " ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ "
read -s -n 1 -p "Press any key to continue . . ."
echo
