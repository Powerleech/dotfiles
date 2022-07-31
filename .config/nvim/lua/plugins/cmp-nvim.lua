vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require'cmp'
local lspkind = require'lspkind'
local luasnip = require'luasnip'

cmp.setup({
  snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },
  mapping = {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- TabCompletion
    -- ["<Tab>"] = function(fallback)
    ["<C-j>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<C-k>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    -- Confirm
    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'spell' },
    { name = 'path'},
    { name = 'buffer' },
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        gh_issues = "[issues]",
        tn = "[TabNine]",
      },
    },
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})
