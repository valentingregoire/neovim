local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
    use({ "williamboman/mason.nvim" })
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "akinsho/bufferline.nvim" })
	use({ "moll/vim-bbye" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	--[[ use({ "ahmedkhalf/project.nvim" }) ]]
	use({ "lewis6991/impatient.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "goolord/alpha-nvim" })
	-- pop up with key bindings
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				window = {
					border = "none", -- none, single, double, shadow
					margin = { 1, 0, 2, 0 }, -- extra window margin [top, right, bottom, left]
				},
				layout = {
					height = { min = 5, max = 25 }, -- min and max height of the columns
				},
			})
		end,
	})

	-- lightspeed motion
	use("ggandor/lightspeed.nvim")

	-- vsnip (null-ls)
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	-- refactoring (null-ls)
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- color preview
	use("norcalli/nvim-colorizer.lua")

	-- some pop-up windows
	use("stevearc/dressing.nvim")

	-- notifier
	use("rcarriga/nvim-notify")

	-- scroll bar
	use("petertriho/nvim-scrollbar")

	-- Colorschemes
	--[[ use({ "folke/tokyonight.nvim" }) ]]
	-- use({ "lunarvim/darkplus.nvim" })
    use({ "navarasu/onedark.nvim" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- todo highlights
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- -- snippets
	-- use({ "L3MON4D3/LuaSnip" }) --snippet engine
	-- --[[ use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use ]]

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	use({ "tom-anders/telescope-vim-bookmarks.nvim" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })

	-- Git
	use({ "lewis6991/gitsigns.nvim" })
	--[[ use("kdheepak/lazygit.nvim") ]]
	-- use({ "codeindulgence/vim-tig" })

	-- Diff view
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- -- LSP
	-- use({ "neovim/nvim-lspconfig" }) -- enable LSP
	-- use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
	-- use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	-- use({ "RRethy/vim-illuminate" })

	-- Bookmarks
	use({ "mattesgroeger/vim-bookmarks" })

	-- -- quick run
	-- use("is0n/jaq-nvim")
	-- use({ "michaelb/sniprun", run = "bash ./install.sh" })

	-- -- DAP
	-- use({ "mfussenegger/nvim-dap" })
	-- use({ "rcarriga/nvim-dap-ui" })
	-- use({ "theHamsta/nvim-dap-virtual-text" })
	-- --[[ use({ "ravenxrz/DAPInstall.nvim" }) ]]
	-- use({ "mfussenegger/nvim-dap-python" })

	-- -- unit tests
	-- use({
	-- 	"nvim-neotest/neotest",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"antoinemadec/FixCursorHold.nvim",
	-- 		"nvim-neotest/neotest-python",
	-- 		"nvim-neotest/neotest-plenary",
	-- 		"nvim-neotest/neotest-vim-test",
	-- 	},
	-- })

	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	--[[ -- Sessions ]]
	use("shatur/neovim-session-manager")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
