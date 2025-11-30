vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("ruff")
vim.lsp.enable("ts_ls")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
    local opts = { buffer = ev.buf }

    opts.desc = "Show hower info"
		vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)

    opts.desc = "Show LSP definition"
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    opts.desc = "Go to declaration"
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show available code actions"
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Format"
		vim.keymap.set("n", "gf", vim.lsp.buf.format, opts)
  end,
})

vim.diagnostic.config({
	virtual_text = true,
})
