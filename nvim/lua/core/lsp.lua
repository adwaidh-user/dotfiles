vim.lsp.enable({
	"clangd",
	"lua_ls",
	"ruff",
	"pyright",
	"eslint-lsp",
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local bufnr = ev.buf
		local opts = { buffer = bufnr }

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
	end,
})

vim.diagnostic.config({
	virtual_text = true,
})
