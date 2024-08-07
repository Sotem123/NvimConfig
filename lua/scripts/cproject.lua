-- This code is intended to automate the generation of projects.
-- It should later be made into a nvim plugin.
function Build()

    local str = debug.getinfo(2, "S").source:sub(2);
    return str:match("(.*/))")
end

function NewProject()

    os.execute();
end
