vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>s", mode = { "n", "o", "x" }, function() require("flash").jump() end,              desc = "Flash" },
    { "<leader>S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "<leader>r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "<leader>R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  }

},{
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
}})

local keymap = vim.keymap

-- disable causes odd behaviour with vscode
-- keymap.set('', "<C-w>", '',)

keymap.set({'v','n'}, "<leader>d", "\"_d",{ desc = "Void delete"})

keymap.set({'v','n'}, "<leader>y", "\"+y",{ desc = "Yank to clipboard" })
keymap.set({'v','n'}, "<leader>y", "\"+y",{ desc = "Yank to clipboard" })

keymap.set('n', "<leader>p", "\"+p", {desc = "Paste from clipboard"})
keymap.set('n', "<leader>P", "\"+P", {desc = "Paste from clipboard"})

keymap.set('', ';', ':')
keymap.set('', ':', ';')

-- keymap.set({'n','x'}, ",", ":call VSCodeNotify('whichkey.show')<CR>", {silent = true})
keymap.set({'n','x'}, "za", ":call VSCodeNotify('editor.toggleFold')<CR>", {silent = true})
keymap.set({'n','x','o'}, "gc", ":VSCodeCommentary<CR>", {silent = true})
keymap.set('n', "<leader>a", "mzJ`z", {desc = "Append next line", silent = true})
vim.opt.hlsearch = false

keymap.set('n', '<C-j>', ":m .+1<CR> ==",{ desc = "Line down", silent = true})
keymap.set('n', '<C-k>', ":m .-2<CR> ==",{ desc = "Line up", silent = true})

keymap.set('x', '<C-k>', ":m '<-2<CR>gv=gv",{ desc = "Line up", silent = true})
keymap.set('x', '<C-j>', ":m '>+1<CR>gv=gv",{ desc= "Line down", silent = true})

vim.api.nvim_create_autocmd("TextYankPost", {
	command = ":silent! lua vim.highlight.on_yank({timeout=250})"
})
