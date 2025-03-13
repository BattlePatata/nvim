return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.blade = {
            install_info = {
                url = "~/blade_parser/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade"
        }

        vim.filetype.add({
            pattern = {
                [".*%.blade%.php"] = "blade",
            },
        })

        parser_config.razor = {
            vim.filetype.add({
                pattern = {
                    [".*%.razor"] = "razor"
                }
            })
        }

		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"html",
				"php_only",
				"php",
				"bash",
				"css",
				"javascript",
				"lua",
				"c",
				"dockerfile",
				"xml",
				"vim",
				"xml",
				"c_sharp",
				"cmake",
				"cpp",
                "razor",
			},
			sync_install = true,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
