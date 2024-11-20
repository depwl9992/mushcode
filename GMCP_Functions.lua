function SendGMCP(message, content)
	json = require("json")
	if type(message) ~= "string" then
		return nil, "Message name must be a string."
	end -- if
	local data = message
	if content ~= nil then
		content = json.encode({content})
		if content == nil then
			return nil, "Invalid input."
		end -- if
		data = data .. " " .. content:sub(2, #content-1)
	end -- if
	SendPkt("\255\250\201" .. data .. "\255\240")
	return true
end -- function

function SplitGMCP(text)
	json = require("json")
	--dataSplit = utils.split(text, '{',1)
	message, params = string.match (text, "([%a.]+)%s+(.*)")
	--Note(message)
	--Note(params)
	--module = string.sub(dataSplit[1],1,string.len(dataSplit[1])-1)
	--if dataSplit[2] == null then
	--	return module, false
	--else
	--	data = "{" .. dataSplit[2]
	--end -- if

	if params ~= null then
		return message, params
	end -- if	
end -- function
