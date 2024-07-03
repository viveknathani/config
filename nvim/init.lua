-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable 24-bit color
vim.opt.termguicolors = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    	{
  		"nvim-tree/nvim-tree.lua",
  		version = "*",
  		lazy = false,
  		dependencies = {
    			"nvim-tree/nvim-web-devicons",
  		},
  		config = function()
    			require("nvim-tree").setup {}
  		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "nvim-telescope/telescope.nvim" },
        { "nvim-lua/plenary.nvim" },
	{ "neovim/nvim-lspconfig" }
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

require('nvim-web-devicons').setup {
  default = true;
}

-- Configure the Catppuccin color scheme
require('catppuccin').setup {
  flavour = "macchiato", -- Set flavour to 'macchiato'
  transparent_background = false, -- Enable/disable transparent background
  term_colors = true, -- Set terminal colors
  styles = { -- Customize styles for different syntax groups
    comments = { "italic" },
    functions = { "bold" },
    keywords = { "italic" },
    strings = {},
    variables = {},
  },
  integrations = { -- Enable integrations with other plugins
    treesitter = true,
    nvimtree = true,
    telescope = true,
    -- Add other integrations as needed
  },
}

-- Set the color scheme
vim.cmd.colorscheme "catppuccin"


-- Configure telescope
require('telescope').setup {
  defaults = {
    -- Your telescope configuration here
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

-- Set keybinding for file search
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })


-- Configure LSP servers
local lspconfig = require('lspconfig')

-- Example configuration for Python using pyright
lspconfig.pyright.setup{}

-- Example configuration for TypeScript using tsserver
lspconfig.tsserver.setup{}

