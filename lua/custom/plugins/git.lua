return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim',

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('neogit').setup {
      graph_style = 'unicode',
      integrations = {
        telescope = true,
        diffview = true,
      },
    }
    vim.keymap.set('n', '<leader>G', function()
      require('neogit').open()
    end, { desc = 'Open Neo[G]it View' })
  end,
}
