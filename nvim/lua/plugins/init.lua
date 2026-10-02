local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
  },

  {
    "nvim-lualine/lualine.nvim",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
        },
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",

    config = function()
      require("ibl").setup()
    end,
  },

  {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").install({
      "lua",
      "bash",
      "python",
      "c",
      "cpp",
      "html",
      "css",
      "javascript",
      "json",
      "markdown",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua",
        "bash",
        "python",
        "c",
        "cpp",
        "html",
        "css",
        "javascript",
        "json",
        "markdown",
      },

      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
},
})
