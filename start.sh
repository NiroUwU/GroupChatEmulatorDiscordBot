#!/bin/bash

InfoFile="
BotInformation = {
	token = '%s'
}

return BotInformation
"

function startSetup() {
	echo -e "Welcome to the setup! Please follow the instructions to get started..."
	
	printf "Bot token: " && read -r TOKEN

	printf "$InfoFile\n" "$TOKEN" > BotInformation.lua
	echo -e "Setup completed! Continuing to bot startup."
}

# Update bot files if new changes:
git pull

# Start setup and create bot info file:
[ ! -f "BotInformation.lua" ] && startSetup

# Start the bot:
luvit main.lua || echo -e "The bot was terminated on $(date)!"
