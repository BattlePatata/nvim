return {
	"lmburns/kimbox",
	name = "kimbox",
	priority = 1000,
	config = function()
		require("kimbox").setup()
		vim.cmd.colorscheme "kimbox"
	end
}
