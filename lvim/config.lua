-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- TODO: learn vim surround, vim-matchup

--LSP
require("lsp-config.tailwindcss")
require("specialFunc.quickFix")

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "tokyonight"
vim.opt.relativenumber = true
--lvim.log.level = "debug"
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymappin
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<A-t>"] = ":ToggleTerm<cr>"
lvim.keys.normal_mode["q"] = ""

-- unmap a default keymappinig
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
local actions = require("telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
	},
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}
--INFO: telescope with nvim-bqf cool interaction with quickFix Lists
-- Search for text by calling <leader>st
-- you can then navigate between elementa using <C-J><C-K> and can start a selection by using <C-i>
-- if wanting all the fzf filtered results <C-q> (while in the telescope window) to send all to a quickFix list
-- if a selection was done previously then use <A-q> (while in the telescope window) to only send the items to a quickFix List
-- INFO: to toggle thet quickFix list use <A-q> while in normal mode to toggle the quickfixwind.
-- lsp integration can be had with folke/troule <Leader>td

--WARN: new command! You can use <A-j><A-k> to move line up and down!
-- INFO: usage trouble for its reference and all the bugs

lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- Use which-key to add extra bindings with the leader-key prefix
-- BUG: known bug that when exiting the trouble quickfix window release to the wrong window
-- renbinded q
 lvim.builtin.which_key.mappings["q"] = {q = { ":xa",'save and quit'}}
 lvim.builtin.which_key.mappings["t"] = {

   name = "+Trouble",
   r = { "<cmd>Trouble lsp_references<cr>", "References" },
   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
 }

--  lvim.builtin.which_key.mappings["s"]={
--   T = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Trouble.nvim" },
-- }

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

lvim.builtin.notify.active = true
lvim.builtin.cmp.completion.keyword_length = 2
lvim.lsp.automatic_servers_installation = true
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.autopairs.active = true
lvim.builtin.terminal.active = true
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"python",
	"lua",
	"bash",
	"css",
	"dockerfile",
	"html",
	"javascript",
	"json",
	"svelte",
	"typescript",
	"yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.keys.normal_mode["<S-x>"] = ":lua require('FTerm').toggle()<CR>"

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8,
--     args = {}
--   }
-- }

-- Additional Plugins
lvim.plugins = {
	-- theme
	{ "folke/tokyonight.nvim" },
	{ "LunarVim/ColorSchemes" },
	--extra languages'
	{ "ChristianChiarulli/vim-solidity" },
	-- lsp
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
	},


	-- movement
  {
  "ggandor/lightspeed.nvim",
  event = "BufRead",
},

	{
		"tpope/vim-surround",
		keys = { "c", "d", "y" },
	},
	{
		"andymass/vim-matchup",
		event = "CursorMoved",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	-- git
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
	},
	-- windows
	{
		"kevinhwang91/nvim-bqf",
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	},
  {
  "folke/trouble.nvim",
    cmd = "TroubleToggle",
},

	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = true, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
				-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
				-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
			})
		end,
	},
	-- proper comment context
	-- {
	--   "JoosepAlviste/nvim-ts-context-commentstring",
	--           enable = true,
	--         config = {
	--              -- Languages that have a single comment style
	--             typescript = '// %s',
	--             css = '/* %s */',
	--             scss = '/* %s */',
	--             html = '<!-- %s -->',
	--             svelte = '<!-- %s -->',
	--             vue = '<!-- %s -->',
	--         },
	--   event = "BufRead",
	-- },
	-- better comment flags
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	-- telescope plugins
	{
		"nvim-telescope/telescope-fzy-native.nvim",
		run = "make",
		event = "BufRead",
	},

	-- You must install glow globally
	-- https://github.com/charmbracelet/glow
	-- yay -S glow
	{
		"npxbr/glow.nvim",
		ft = { "markdown" },
		-- run = "yay -S glow"
	},

	-- autoSave
	{
		"Pocco81/AutoSave.nvim",
		config = function()
			require("autosave").setup({ debounce_delay = 500 })
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		setup = function()
			vim.g.indentLine_enabled = 1
			vim.g.indent_blankline_char = "▏"
			vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
			vim.g.indent_blankline_buftype_exclude = { "terminal" }
			vim.g.indent_blankline_show_trailing_blankline_indent = false
			vim.g.indent_blankline_show_first_indent_level = false
		end,
	},
	{
		"tzachar/cmp-tabnine",
		config = function()
			local tabnine = require("cmp_tabnine.config")
			tabnine:setup({
				max_lines = 1000,
				max_num_results = 20,
				sort = true,
			})
		end,

		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
