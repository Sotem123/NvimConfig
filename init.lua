package.path = package.path .. ";/home/Sotem/.config/nvim/lua/utils/?.lua"

require("config.lazy");
require("config.keymappings");
require("file_helpers");
