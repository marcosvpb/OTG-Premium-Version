local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not(npcHandler:isFocused(cid))) then
		return false
	end
   	local player = Player(cid)  	
	if (msgcontains(msg, 'research notes')) then
			if(player:getStorageValue(Storage.ShadownofYalahar.QuestStart) == 1) and player:getStorageValue(Storage.ShadownofYalahar.Boveas) < 1 then
			npcHandler:say("Oh, of course I can send him my research notes. I'll drop them into the next mailbox as soon as possible. May the Gods bless the royal Tibian mail system and its fearless and sometimes maimed postmen.", cid)
			player:setStorageValue(Storage.ShadownofYalahar.Questline, player:getStorageValue(Storage.ShadownofYalahar.Questline) + 1)
			setPlayerStorageValue(cid, 82960, getPlayerStorageValue(cid, 82960) + 1) -- quest log
			player:setStorageValue(Storage.ShadownofYalahar.Boveas, 1)
			npcHandler.topic[cid] = 0
	    	end
		end
	return true
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())