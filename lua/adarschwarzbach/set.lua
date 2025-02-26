vim.cmd.colorscheme("tokyonight")

vim.opt.nu = true                 -- set line numbers -- set line numbers
vim.opt.relativenumber = true     -- use relative line numbers
vim.opt.clipboard = "unnamedplus" --  use system copy buffer for yank
vim.opt.mouse = "a"               -- allow the mouse :(
vim.opt.splitright = true
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.linebreak = true
vim.opt.fillchars.eob = " " -- represent empty lines at the end of a buffer as ` ` {default `~`}
vim.opt.cursorline = true
vim.opt.ignorecase = true   -- ignore case for search
vim.opt.swapfile = false


-- set tab size to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.title = true     -- When on, the title of the window will be set to the value of 'titlestring'
vim.opt.showmatch = true -- When a bracket is inserted, briefly jump to the matching one.

vim.opt.wrap = false

vim.opt.incsearch = true -- incremental search
vim.opt.termguicolors = true
