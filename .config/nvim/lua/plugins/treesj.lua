return {
    'Wansmer/treesj',
    keys = { { "<leader>m", function() require("treesj").toggle() end, desc = "Toggle TSJ block" }, },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { use_default_keymaps = false }
}
