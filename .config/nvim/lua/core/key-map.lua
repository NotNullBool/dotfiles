local keymap = vim.keymap
keymap.set('', 'J', "<C-d>zz")
keymap.set('', 'K', "<C-u>zz")

keymap.set('i', "<C-L>", "<right>")
keymap.set('i', "<C-H>", "<left>")
keymap.set('i', "<C-J>", "<down>")
keymap.set('i', "<C-K>", "<up>")
keymap.set('n', "<leader>a", "mzJ`z", {desc = "Append next line", silent = true})

keymap.set('n', 'n', "nzzzv")
keymap.set('n', 'N', "Nzzzv")

keymap.set('n', '<C-j>', ":m .+1<CR> ==",{ desc = "Line down", silent = true})
keymap.set('n', '<C-k>', ":m .-2<CR> ==",{ desc = "Line up", silent = true})

keymap.set('x', '<C-k>', ":m '<-2<CR>gv=gv",{ desc = "Line up", silent = true})
keymap.set('x', '<C-j>', ":m '>+1<CR>gv=gv",{ desc= "Line down", silent = true})

keymap.set({'v','n'}, "<leader>r", "r",{ desc = "Regular replace"})
keymap.set({'v','n'}, "r", "\"_r",{ desc = "Void replace"})
keymap.set({'v','n'}, "<leader>x", "x",{ desc = "Regular char delete"})
keymap.set({'v','n'}, "x", "\"_x",{ desc = "Void char delete"})
keymap.set({'v','n'}, "<leader>d", "d",{ desc = "Regular delete"})
keymap.set({'v','n'}, "d", "\"_d",{ desc = "Void delete"})
keymap.set('', 'c', "\"_c", {desc = "Void change"})
keymap.set('', 'C', "\"_C", {desc = "Void change"})
keymap.set('', '<leader>C', "C", {desc = "Regular change"})
keymap.set('', '<leader>c', "c", {desc = "Regular change"})

keymap.set({'v','n'}, "<leader>y", "\"+y",{ desc = "Yank to clipboard" })

keymap.set('n', "<leader>p", "\"+p", {desc = "Paste from clipboard"})
keymap.set('n', "<leader>P", "\"+P", {desc = "Paste from clipboard"})

keymap.set('n', "<leader>k", ":cprev<CR>zz", {desc = "Quick fix select previous"})
keymap.set('n', "<leader>j", ":cnext<CR>zz", {desc = "Quick fix select next"})

keymap.set('n', "<leader>q", ":cclose<CR>", {desc = "Close quick fix"})

keymap.set('', ';', ':')
keymap.set('', ':', ';')

keymap.set('n', 's', '^i')

keymap.set('n', "<leader><TAB>", ":bn<CR>", {silent = true})
keymap.set('n', "<leader><S-TAB>", ":bp<CR>", { silent = true })

vim.keymap.set("n", "i", function()
	if #vim.fn.getline "." == 0 then
		return [["_cc]]
	else
		return "i"
	end
end, { expr = true })
