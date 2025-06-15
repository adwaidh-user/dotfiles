return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		-- base configuration
		bufferline.setup({
			options = {
				mode = "none", -- set to "tabs" to only show tabpages instead
				numbers = "none",
				close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
				right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
				middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
				indicator = {
					icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "icon", -- 'icon' | 'underline' | 'none',
				},
				buffer_close_icon = "󰅖",
				modified_icon = "● ",
				close_icon = " ",
				left_trunc_marker = " ",
				right_trunc_marker = " ",
				max_name_length = 18,
				max_prefix_length = 15,         -- prefix used when a buffer is de-duplicated
				truncate_names = true,          -- whether or not tab names should be truncated
				tab_size = 20,
				diagnostics = "nvim-lsp",       -- false | "nvim_lsp" | "coc"
				diagnostics_update_on_event = true, -- use nvim's diagnostic handler
				-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					return "(" .. count .. ")"
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left", -- "left" | "center" | "right"
						separator = true,
					},
				},
				color_icons = true,
				show_buffer_icons = true, -- disable filetype icons for buffers
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
				duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
				persist_buffer_sort = true,  -- whether or not custom sorted buffers should persist
				move_wraps_at_ends = false,  -- whether or not the move command "wraps" at the first or last position
				-- can also be a table containing 2 custom separators
				-- [focused and unfocused]. eg: { '|', '|' }
				separator_style = "thick", -- slant" | "slope" | "thick" | "thin" | { "any", "any" }
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				auto_toggle_bufferline = true,
			},
		})
	end,
	enabled = true,
}
