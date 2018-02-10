
GuildWarning = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceEvent-2.0")


function GuildWarning:OnInitialize()
end

function GuildWarning:OnEnable()
	self:Print("GuildWarning Enabled. (USAGE: /gw <message>)")
	self:RegisterEvent("CHAT_MSG_ADDON")
	self:RegisterChatCommand({'/guildwarning', '/gw'}, SendGW)
end

function GuildWarning:OnDisable()
end

function SendGW(gwmsg)
	charName = UnitName("player");
	fullMsg = "<" .. charName .. "> " .. gwmsg;
	SendChatMessage(gwmsg, "GUILD");
	SendAddonMessage("GuildWarning", fullMsg, "GUILD");
	return;
end


function GuildWarning:CHAT_MSG_ADDON(prefix, message, distribution, sender)
	if sender and message and prefix == "GuildWarning" and distribution == "GUILD"
	then
--	self:Print("Received: ", message);
		GuildWarning:HandleMessage(message);
	end
end

function GuildWarning:HandleMessage(message)
	local color = {r = 0, g = 1, b = 0}
	RaidNotice_AddMessage(RaidWarningFrame, message, color);
end
