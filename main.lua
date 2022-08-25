Discordia = require("discordia")
Client = Discordia.Client()
BotInformation = require("BotInformation")

Client:on("ready", function()
	print("Bot is ready!")
end)

Client:on("messageCreate", function(Message)
	-- Check if message was sent in server:
	if Message.member == nil then return end

	-- Check if message content was present:
	if #tostring(Message.content) < 1 then return end

	-- Check if the bot sent the message:
	if Message.author.id == Client.user.id then return end

	-- Send ping messaage:
	local replyString = string.format("**%s** sent a message!\n@everyone", Message.author.mentionString)
	local reply = Message:reply(replyString)

	-- Delete Ping Message:
	if reply == nil then return end
	reply:delete()
end)

Client:run(string.format("Bot %s", BotInformation.token))
