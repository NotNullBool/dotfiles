return {
    "mfussenegger/nvim-dap",
    dependencies = { "jay-babu/mason-nvim-dap.nvim", "williamboman/mason.nvim" },
    config = function ()
    	local mason_dap = require("mason-nvim-dap")
    	mason_dap.setup({
	    automatic_installation = true,
	    handlers = {
	    	function (config)
	    	    mason_dap.default_setup(config)
	    	end,
	    }
	})
    end
}
