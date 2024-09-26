local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    markdown = { "prettier" },
    yaml = { "prettier" },
    graphql = { "prettier" },
    vue = { "prettier" },
    svelte = { "prettier" },
    python = { "black" },
    rust = { "rustfmt" },
    go = { "gofmt" },
    sh = { "shfmt" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
