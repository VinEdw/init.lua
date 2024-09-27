return {
  -- Telescope fuzzy finder
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { '<leader>ff', function () require("telescope.builtin").find_files() end },
    { '<leader>rg', function () require("telescope.builtin").live_grep() end },
    { '<leader>fb', function () require("telescope.builtin").buffers() end },
    { '<leader>gf', function () require("telescope.builtin").git_files() end },
  },
}
