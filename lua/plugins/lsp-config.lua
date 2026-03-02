return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"omnisharp",
				},
				auto_install = true,
			})
		end,
	},
    {
        "Hoffs/omnisharp-extended-lsp.nvim"
    },
	{
        "neovim/nvim-lspconfig",
        config = function()
            --	local capabilities = require("cmp_nvim_lsp").default_capabilities()
            vim.lsp.config('*', {
                capabilities = {
                    textDocument = {
                        semanticTokens = {
                            multilineTokenSupport = true,
                        }
                    }
                }
            })
            --    local lspconfig = require("lspconfig")
            --    local mason_registry = require("mason-registry")
            --    local omnisharp = mason_registry.get_package("omnisharp")
            --    local omnisharp_path = omnisharp:get_install_path()
            --    local omnisharp_ext = require("omnisharp_extended")
            --	lspconfig.lua_ls.setup({
            --		capabilities = capabilities,
            --	})
            --	lspconfig.clangd.setup({
            --		capabilities = capabilities,
            --	})
            --	lspconfig.jsonls.setup({
            --		capabilities = capabilities,
            --	})
            --	lspconfig.stimulus_ls.setup({
            --		capabilities = capabilities,
            --	})
            --	lspconfig.marksman.setup({
            --		capabilities = capabilities,
            --	})
            --	lspconfig.csharp_ls.setup({
            --		capabilities = capabilities,
            --	})
            vim.lsp.config("omnisharp", {
                enable_roslyn_analyzers = true,
                organize_imports_on_format = true,
                enable_import_completion = true,
                filetypes = { "cs", "razor", "xml" },
            })
            vim.lsp.config("intelephense", {
                settings = {
                    intelephense = {
                        files = {
                            maxSize = 4000000,
                        },
                    },
                },
                root_markers = {".git", "composer.json"},
            })

            vim.diagnostic.config({
                virtual_text = {
                    prefix = "■", -- ■ Could be '--', '▎', 'x'
                },
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})

        end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
