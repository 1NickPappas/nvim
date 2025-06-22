return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Make sure to load this before other plugins that depend on it
  config = function()
    -- Configure Catppuccin
    require("catppuccin").setup({
      flavour = "mocha", -- The key setting for your request!
      -- Other flavours: "latte", "frappe", "macchiato"

      -- Bonus: Enable integrations with other plugins
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        -- For more, see the Catppuccin docs: https://github.com/catppuccin/nvim
      }
    })

    -- Setup must be called before loading the colorscheme
    vim.cmd.colorscheme "catppuccin"
  end,
}
