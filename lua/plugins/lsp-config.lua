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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
            local omnisharp_ext = require("omnisharp_extended")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.stimulus_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
		--	lspconfig.csharp_ls.setup({
		--		capabilities = capabilities,
		--	})
		    lspconfig.omnisharp.setup({
		    	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
		    	enable_roslyn_analyzers = true,
		    	organize_imports_on_format = true,
		    	enable_import_completion = true,
		    	filetypes = { "cs", "razor", "xml" },
		    })
			lspconfig.intelephense.setup({
				capabilities = capabilities,
				root_dir = lspconfig.util.root_pattern(".git", "composer.json"),
			})

			vim.diagnostic.config({
				virtual_text = {
					prefix = "■", -- ■ Could be '--', '▎', 'x'
				},
			})

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})

            if lspconfig.omnisharp then
                vim.keymap.set("n", "gd", omnisharp_ext.telescope_lsp_definition, { noremap = true })
                vim.keymap.set("n", "<leader>D", function() omnisharp_ext.telescope_lsp_references() end, { noremap = true })
                vim.keymap.set("n", "gi", omnisharp_ext.telescope_lsp_implementation, { noremap = true })
            else
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            end
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
