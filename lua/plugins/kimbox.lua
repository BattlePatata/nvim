return {
	"lmburns/kimbox",
	name = "kimbox",
	priority = 1000,
	config = function()
		require("kimbox").setup({
            style = "zinnwaldite"
        })
		vim.cmd.colorscheme "kimbox"
	end
}
