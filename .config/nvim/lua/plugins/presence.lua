return {
	"andweeb/presence.nvim",
	event = "VeryLazy",
	opts = function()
		vim.cmd[[silent! !ln -f $XDG_RUNTIME_DIR/{app/com.discordapp.Discord,}/discord-ipc-0]]
		-- return {log_level = "debug"}
	end
}
