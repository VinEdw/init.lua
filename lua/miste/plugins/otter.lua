return {
  {
    "jmbuhr/otter.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
    },
    config = function(_, opts)
      local otter = require("otter")
      otter.setup(opts)

      -- Automatically activate otter for Typst files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "typst" },
        callback = function()
          -- "python" tells otter to look for embedded python blocks.
          -- Set completion and diagnostics to true.
          otter.activate({ "python" }, true, true, nil)
        end,
      })

      -- Automatically activate otter for Typst files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "typst" },
        callback = function()
          -- More languages can be added to the list as needed
          otter.activate({ "python" }, true, true, nil)
        end,
      })

    end,
  }
}
