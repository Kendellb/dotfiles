--line numbering
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 tab indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false --??

--Backup undoTree and turn off backups
vim.opt.swapfile = false
vim.opt.backup = false
-- fix vim.opt.undodir = os.getenv("$HOME") .. "/.vim/undodir" --location of undo tree
vim.opt.undofile = true

--search "/"
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

--scroll options
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

--fast update time
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

--vim.cmd([[colorscheme catppuccin-frappe]])

