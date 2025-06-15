local o = vim.opt

--Editor options

o.number = true							-- print line# in front of each line
o.relativenumber = true			-- print line# relative to the current line
o.clipboard = "unnamedplus" -- use clipboard register for all operations except yank(copy)
o.syntax = on								-- enable neovim's syntax highlighting
o.autoindent = true 				-- copy the indent from current line when staring a new line
o.expandtab = true					-- in insert mode use appropriate # of spaces for <Tab> (space for tab)
o.shiftwidth = 4						-- #spaces for each (auto)indent
o.tabstop = 4								-- #spaces a <Tab> uses
o.cursorline = true					-- highlight the current line
o.encoding = "UTF-8"				-- the character encoding used inside nvim
o.ruler = true							-- show current line and column position, separated by a coma.
o.mouse = "a"								-- enable the use of mouse {a:= all, n:=normal, v:=visual, i:=insert}
o.title = true							-- when on, the title of window will be set to 'titlesring'
o.hidden = true							-- When on a buffer becomes hidden when it is |abandon|ed
o.ttimeoutlen = 20					-- Time in milliseconds to wait for a key code sequence to complete.
o.wildmenu = true						-- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
o.showcmd = true						-- Show (partial) command in the last line of the screen.  Set this option off if your terminal is slow.
o.showmatch = true					-- When on, breifly jump to matching bracket, parenthisis, etc.
o.inccommand = "split"			-- When non-empty, show the effect of :substitute :smagic :snomagic and usercommands with :comand-preview flag as you type.
o.wrap = false							--When on, lines longer than the width of the window will wrap and displaying continues on the next line.
o.splitright = true
o.splitbelow = false
o.termguicolors = true
