local nls = require "null-ls"

local opts = {}

-- golang
opts.sources = vim.list_extend(opts.sources or {}, {
  nls.builtins.code_actions.gomodifytags,
  nls.builtins.code_actions.impl,
  nls.builtins.formatting.goimports_reviser,
  nls.builtins.formatting.gofumpt,
  nls.builtins.formatting.golines,
})

-- docker
opts.sources = vim.list_extend(opts.sources or {}, {
  nls.builtins.diagnostics.hadolint,
})

-- terraform
opts.sources = vim.list_extend(opts.sources or {}, {
  nls.builtins.formatting.terraform_fmt,
  nls.builtins.diagnostics.terraform_validate,
})

-- python
opts.sources = vim.list_extend(opts.sources or {}, {
  nls.builtins.diagnostics.mypy,
  nls.builtins.diagnostics.ruff,
})

return opts
