return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,  -- load early for colorscheme
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
      })
      vim.cmd("colorscheme nordfox")
      vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalFloat guibg=NONE ctermbg=NONE
]])

    end,
  },
}

