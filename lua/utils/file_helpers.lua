local mod = {};

function mod.FileExists(path)

	local f = io.open(path, "r");

	if f~=nil then io.close(f)
		return true;
	else
		return false;
	end
end

return mod;
