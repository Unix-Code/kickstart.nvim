return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
    'ibhagwan/fzf-lua', -- optional
    'echasnovski/mini.pick', -- optional
  },
  config = function()
    require('neogit').setup {
      graph_style = 'unicode',
    }
    vim.keymap.set('n', '<leader>G', function()
      require('neogit').open()
    end, { desc = 'Open Neo[G]it View' })
  end,
}
