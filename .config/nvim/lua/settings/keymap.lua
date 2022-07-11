-- https://raw.githubusercontent.com/crivotz/nv-ide/master/lua/settings/keymap.lua
-- vim.keymap.set('n', '<space>;', ':lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
-- vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", {silent = true, noremap = true})
-- Functional wrapper for mapping custom keybindings
-- " Sweet Sweet FuGITive
-- nmap <leader>gj :diffget //3<CR>
-- nmap <leader>gf :diffget //2<CR>
-- nmap <leader>gs :G<CR>

-- " Search and replace hotkey
-- nnoremap H :%s//gc<left><left><left>

-- " Move highlighted text up and down
-- vnoremap J :m '>+1<CR>gv=gv

-- " Disable arrow keys
-- noremap <Up> <Nop>
-- noremap <Down> <Nop>
-- noremap <Left> <Nop>
-- noremap <Right> <Nop>

-- command! -bang -nargs=* Rg
--   \ call fzf#vim#grep(
--   \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
--   \   fzf#vim#with_preview(), <bang>0)





function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-n>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
map("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })
map("n", "<C-p>g", ":Telescope git_files<CR>", { noremap = true, silent = true })
map("n", "<C-f>", ":Rg<CR>", { noremap = true, silent = true })
map("n", "<C-t>", ":e <cfile><CR>", { noremap = true, silent = true })
map("n", "<S-tab>", ":bn<CR>", { noremap = true, silent = true })


