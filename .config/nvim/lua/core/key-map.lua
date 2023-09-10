local keymap = vim.keymap
keymap.set('n', 'J', ":m .+1<CR> ==",{ desc = "Line down"})
keymap.set('n', 'K', ":m .-2<CR> ==",{ desc = "Line up"})

keymap.set('x', 'K', ":m '<-2<CR>gv=gv",{ desc = "Line up"})
keymap.set('x', 'J', ":m '>+1<CR>gv=gv",{ desc= "Line down"})

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
