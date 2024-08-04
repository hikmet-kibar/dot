vim.opt.autowrite = true        -- autosave when changing
vim.opt.backup = false		-- more risky, but cleaner
vim.opt.belloff = "all"
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1         	-- avoid HitEnter prompts
vim.opt.colorcolumn = ""
vim.opt.compatible = false
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.fixendofline = false	-- prevent silent fixing by vim
vim.opt.hidden = true         	-- when switching buffers
vim.opt.history = 100
vim.opt.hlsearch = false
vim.opt.icon = true
vim.opt.ignorecase = true
vim.opt.incsearch = true      	-- highlight search while typing
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shortmess = "aoOtIF"    	-- avoid HitEnter prompts
vim.opt.showmatch = true
vim.opt.showmode = true
vim.opt.swapfile = false

vim.o.listchars = "space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\\|>"
vim.o.statusline = "    %l:%c   %p%%    %<%.60F     [%{strlen(&ft)?&ft:'none'}]"

vim.opt.fixendofline = false  	-- better ascii friendly listchars
vim.opt.foldenable = true
vim.opt.guicursor = ""
vim.opt.laststatus = 2
vim.opt.ruler = false
vim.opt.wrapscan = true

vim.opt.autoindent = true
vim.opt.expandtab = true    	-- replace tabs with spaces
vim.opt.linebreak = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.textwidth = 72
vim.opt.wildignorecase = true
vim.opt.wildmenu = true     	-- better command search

vim.g.netrw_altv = 1
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_fastbrowse = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25
