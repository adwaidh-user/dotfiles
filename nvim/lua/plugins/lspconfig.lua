return {
    {
        "mason-org/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            capabilities.offsetEncoding = { "utf-16" }

            require("mason-lspconfig").setup({
                automatic_installation = true,
                handlers = {
                    -- Default handler for all servers
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,

                    -- Custom handlers for servers
                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                },
                            },
                            filetypes = { "lua" },
                        })
                    end,
                },
            })
            -- Custom handlers for ervers installed locally and not by mson
            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--all-scopes-completion",
                    "--completion-style=detailed",
                    "--header-insertion-decorators",
                    "--header-insertion=iwyu",
                    "--enable-config",
                    "--pch-storage=memory",
                },
                filetypes = { "c", "cpp", "objc", "objcpp" },
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local bufnr = ev.buf
                    local opts = { buffer = bufnr }

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
                end,
            })

            vim.diagnostic.config({ virtual_text = true })
        end,
    },
}
