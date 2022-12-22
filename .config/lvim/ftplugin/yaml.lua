local opts = {
  settings = {
    yaml = {
      hover = true,
      completion = true,
      validate = true,
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        kubernetes = {
          "daemon.{yml,yaml}",
          "manager.{yml,yaml}",
          "restapi.{yml,yaml}",
          "kubectl-edit*.yaml",
        },
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/configmap.json"] = "*onfigma*.{yml,yaml}",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/deployment.json"] = "*eployment*.{yml,yaml}",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/service.json"] = "*ervic*.{yml,yaml}",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/ingress.json"] = "*ngres*.{yml,yaml}",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/secret.json"] = "*ecre*.{yml,yaml}",
      },
    },
  },
}
require("lvim.lsp.manager").setup("yamlls", opts)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    exe = "prettier",
    filetypes = { "yaml", "yml" },
  },
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    exe = "yamllint",
    filetypes = { "yaml", "yml" },
    args = { "{extends: default, rules: {line-length: disable}}" },
  },
})
