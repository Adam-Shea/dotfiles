call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'whatyouhide/vim-gotham'
Plug 'gilgigilgil/anderson.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'preservim/nerdtree'

Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

"  Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'chriskempson/base16-vim'
Plug 'akinsho/toggleterm.nvim'
Plug 'feline-nvim/feline.nvim'
Plug 'folke/trouble.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'ggandor/lightspeed.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'RRethy/vim-illuminate'
Plug 'romgrk/barbar.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-autopairs'
call plug#end()


let mapleader = ' '
set termguicolors
set encoding=UTF-8

lua <<EOF
require("toggleterm").setup{}
require('feline').setup()
require('colorizer').setup()
-- require("trouble").setup {}
require('nvim-autopairs').setup{}

require'lspconfig'.gopls.setup {
    on_attach = function(client)
      -- [[ other on_attach code ]]
      require 'illuminate'.on_attach(client)
    end,
}

local present, lsp = pcall(require, "lsp-zero")
if not present then
end


local present, null_ls = pcall(require, "null-ls")
if not present then
   return
end

lsp.ensure_installed({
  'html',
  'cssls',
  'angularls',
  'eslint'
})
lsp.preset('recommended')
lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = false,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})

require("nvim-lsp-installer").setup {
    automatic_installation = true
}
lsp.setup_servers({
  root_dir = true,
  'html',
  'cssls'
})

lsp.setup()


EOF

nnoremap <leader>li :LspInstallInfo<CR>
