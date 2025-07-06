return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        opts = {
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            workspace = { checkThirdParty = false },
                            diagnostics = { globals = { "vim" } },
                        },
                    },
                },
                pylsp = {},
                clangd = {},
            },
            diagnostics = {
                virtual_text = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            },
        },
        config = function(_, opts)
            -- Setup diagnostics
            vim.diagnostic.config(opts.diagnostics)

            -- Setup mason + ensure servers
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(opts.servers),
                handlers = {
                    function(server)
                        local server_opts = opts.servers[server] or {}
                        local capabilities = vim.tbl_deep_extend(
                            "force",
                            vim.lsp.protocol.make_client_capabilities(),
                            require("cmp_nvim_lsp").default_capabilities() or {}
                        )
                        server_opts.capabilities = capabilities
                        require("lspconfig")[server].setup(server_opts)
                    end,
                },
            })

            -- Keymaps on attach
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    require("plugins.lsp.keymaps").on_attach(nil, args.buf)
                end,
            })
        end,
    },
}
