---@type vim.lsp.Config
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  cmd = { "emmet-ls", "--stdio" },
  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "scss",
    "javascriptreact",
    "typescriptreact",
    "haml",
    "xml",
    "xsl",
    "pug",
    "slim",
    "sass",
    "less",
    "sss",
    "hbs",
    "handlebars",
  },
  root_markers = { ".git" },
  single_file_support = true,
}
