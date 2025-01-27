  require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<C-y>'] = { 'select_and_accept' },

        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        --Disable snippets
        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        --['<Tab>'] = { },
        --['<S-Tab>'] = { },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    --opts_extend = { "sources.default" },
  })

  -- LSP Configuration
  local lspconfig = require('lspconfig')
  local capabilities = require('blink.cmp').get_lsp_capabilities()

  -- Example of defining LSP servers
  local servers = {
    lua_ls = {}, -- Replace 'lua_ls' with your desired LSP servers
  }

  for server, config in pairs(servers) do
    config.capabilities = capabilities
    lspconfig[server].setup(config)
  end
