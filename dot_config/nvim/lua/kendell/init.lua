require("kendell.remap")
require("kendell.set")
require("kendell.paq")

--require("mason").setup()


-- Automatically require all Lua files in the plugins folder
local plugin_folder = vim.fn.stdpath('config') .. '/lua/kendell/plugins/'
local files = vim.fn.glob(plugin_folder .. '*.lua', true, true)

for _, plugin_file in ipairs(files) do
  local plugin_name = plugin_file:match('plugins/(.*)%.lua$')  -- Get the file name without extension
  if plugin_name then
    require('kendell.plugins.' .. plugin_name)  -- Correctly require the plugin file
  end
end
