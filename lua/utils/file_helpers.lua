local mod = {};

function mod.FileExists(path)

	local f = io.open(path, "r");

	if f~=nil then io.close(f)
		return true;
	else
		return false;
	end
end

function mod.PathExists(path)

	local ok, err, code = os.rename(path, path);

	if not ok then
		if code == 13 then
			-- Permission denied, but it exists.
			return true;
		end
	end

	return ok, err;
end


return mod;
