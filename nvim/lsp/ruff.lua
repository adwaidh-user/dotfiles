return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	on_attach = function(client, bufnr)
		client.server_capabilities.hoverProvider = false
	end,
}
