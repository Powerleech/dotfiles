  -- vim.opt.termguicolors = true




  -- https://github.com/crivotz/nv-ide/blob/master/lua/settings/color.lua
if vim.fn.has("termguicolors") == 1 then
  vim.go.t_8f = "[[38;2;%lu;%lu;%lum"
  vim.go.t_8b = "[[48;2;%lu;%lu;%lum"
  vim.opt.termguicolors = true
end
-- vim.g.gruvbox_material_background = "hard" -- hard, soft, medium
-- vim.g.gruvbox_material_palette = "original" -- original, mix, material
-- vim.g.gruvbox_material_enable_italic = 1
-- vim.g.gruvbox_material_sign_column_background = 'none'
-- vim.cmd 'color gruvbox-material'
   vim.cmd 'colorscheme tokyonight'

local _M = {
    bg = '#282c34',
    fg = '#abb2bf',
    yellow = '#e0af68',
    cyan = '#56b6c2',
    darkblue = '#081633',
    green = '#98c379',
    orange = '#d19a66',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#61afef',
    red = '#e86671'
}

return _M
