-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme hybrid_reverse]]
vim.g.enable_bold_font = true -- Uses bold font for functions and the like

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Ensures we have a status line
vim.o.laststatus = 2

-- Change the way that incorrectly spelled words appear
vim.api.nvim_set_hl(0, 'SpellBad', {underline = true})

-- Enable spell checking
vim.o.spell = true

-- Configure past toggling
vim.o.pastetoggle = '<F2>'

-- Show key sqeuence as it's being typed on the last line
vim.o.showcmd = true

-- Disables showing the mode on the last line
vim.o.showmode = false

-- Use spaces instead of tabs
vim.o.expandtab = true

-- The number of spaces a tab counts for
vim.o.tabstop = 4

-- The number of spaces for each step of auto indenting
vim.o.shiftwidth = 4

-- New lines use the indenting of the previous lines
vim.o.copyindent = true

-- When there's a previous search, highlight it
vim.o.hlsearch = true

-- Override ignorecase if the search pattern contains an upper case character
vim.o.smartcase = true

-- Ignores case in search patterns
vim.o.ignorecase = true

-- Performs  auto indenting when starting a new line
vim.o.smartindent = true

-- Sets the title of the terminal to the current file
vim.o.title = true

-- Set visual bell instead of beeping
vim.o.visualbell = true

-- Horizontal splits below instead of above
vim.o.splitbelow = true

-- Vertical split to the right instead of left
vim.o.splitright = true

-- Show 3 lines above or below the cursor
vim.o.scrolloff = 3

-- Show 5 columns on the left and right of the cursor
vim.o.sidescrolloff = 5

-- Use relative instead of absolute line numbers
vim.o.relativenumber = true

-- Set the complete options
vim.o.completeopt = 'menu,menuone,noselect,noinsert'

-- Continue comment marker in new lines.
vim.opt.formatoptions:append("rol")
