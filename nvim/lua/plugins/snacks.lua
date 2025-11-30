return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		indent = { enabled = true },
		notifier = { enabled = true, timeout = 3000 },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
	},

	keys = {
		{ "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History", },
		{ "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History", },
		-- find
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers", },
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files", },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File", },
		{ "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects", },
		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent", },
	  -- git
		{ "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches", },
		{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log", },
		{ "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line", },
		{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status", },
		{ "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash", },
		{ "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)", },
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit", },
		-- Grep
		{ "<leader>sb", function() Snacks.picker.lines() end, desc = "Grep Buffer Lines", },
		{ "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers", },
		{ "<leader>sg", function() Snacks.picker.grep() end, desc = "Live Grep", },
		-- search
		{ '<leader>s"', function() Snacks.picker.registers() end, desc = "List Register contents", },
		{ "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History", },
		{ "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds", },
		{ "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands", },
		{ "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics", },
		{ "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics", },
		{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages", },
		{ "<leader>si", function() Snacks.picker.icons() end, desc = "Icons", },
		{ "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps", },
		{ "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages", },
		{ "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History", },
		{ "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes", },
		-- LSP
		{ "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References", },
		{ "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation", },
		{ "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition", },
		{ "gs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols", },
		{ "gS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols", },
    -- Buffer
		{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer", },
		{ "<leader>bD", function() Snacks.bufdelete.All() end, desc = "Delete All Buffer", },
		{ "<leader>br", function() Snacks.rename.rename_file() end, desc = "Rename Buffer", },
		-- Other
		{ "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode", },
		{ "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom", },
		{ "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer", },
		{ "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", },
		{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications", },
		{ "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal", },
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...) Snacks.debug.inspect(...) end
				_G.bt = function() Snacks.debug.backtrace() end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }) :map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }) :map("<leader>ub")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle.indent():map("<leader>ug")
				Snacks.toggle.dim():map("<leader>uD")
			end,
		})

		vim.api.nvim_create_autocmd("RecordingEnter", {
			callback = function()
				vim.defer_fn(function()
					local reg = vim.fn.reg_recording()
					if reg and reg ~= "" then
						Snacks.notify.info("Recording @" .. reg, { title = "Macro" })
					end
				end, 20) -- 20ms delay so reg_recording() returns the correct value
			end,
		})

		vim.api.nvim_create_autocmd("RecordingLeave", {
			callback = function()
				Snacks.notify.info("Stopped recording", { title = "Macro" })
			end,
		})
	end,
}
