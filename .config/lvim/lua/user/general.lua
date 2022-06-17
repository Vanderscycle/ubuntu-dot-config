local M = {}

M.config = function()
  lvim.guicursor = "#378900"
  lvim.autosave = true
  lvim.format_on_save = true
  lvim.lint_on_save = true
  lvim.lsp.diagnostics.virtual_text = true
  lvim.colorscheme = "tokyonight"
  vim.opt.relativenumber = true
  vim.opt.wrap = true
  lvim.builtin.notify.active = true
  lvim.builtin.notify.opts.background_colour = "normal"
  lvim.builtin.cmp.completion.keyword_length = 2
  lvim.lsp.automatic_servers_installation = true
  lvim.builtin.alpha.active = true --dashboard replacement
  lvim.builtin.terminal.active = true
  lvim.builtin.nvimtree.side = "left"
  -- lvim.builtin.nvimtree.show_icons.git = 0
  lvim.builtin.autopairs.active = true
  lvim.builtin.treesitter.highlight.enabled = true
  lvim.builtin.terminal.active = true
  lvim.lsp.code_lens_refresh = true
  lvim.builtin.treesitter.ensure_installed = {
    "python",
    "go",
    "lua",
    "rust",
    "bash",
    "dockerfile",
    "html",
    "javascript",
    "json",
    "svelte",
    "typescript",
    "yaml",
    "fish",
  }
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  vim.opt.guifont = "jetbrainsmono" -- the font used in graphical neovim applications
  -- Terminal
  vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
  -- =========================================
  lvim.builtin.terminal.active = true
  lvim.builtin.terminal.open_mapping = [[<c-\>]]

  -- WhichKey
  -- =========================================
  lvim.builtin.which_key.setup.window.winblend = 10
  lvim.builtin.which_key.setup.ignore_missing = true
  -- WIP: move to keybindings??
  -- lvim.builtin.which_key.on_config_done = function(wk)
  -- 	local keys = {
  -- 		["ga"] = { "<cmd>lua require('user.telescope').code_actions()<CR>", "Code Action" },
  -- 		["gR"] = { "<cmd>Trouble lsp_references<CR>", "Goto References" },
  -- 		["gI"] = { "<cmd>lua require('user.telescope').lsp_implementations()<CR>", "Goto Implementation" },
  -- 		["gA"] = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
  -- 		["gt"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
  -- 	}
  -- 	wk.register(keys, { mode = "n" })
  -- end
end

return M
