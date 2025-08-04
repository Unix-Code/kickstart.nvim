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
      graph_style = 'kitty',
      integrations = {
        telescope = true,
        diffview = true,
      },
      git_services = {
        ['github.kensho.com'] = 'https://github.kensho.com/${owner}/${repository}/compare/${branch_name}?expand=1',
        ['github.com'] = 'https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1',
        ['bitbucket.org'] = 'https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1',
        ['gitlab.com'] = 'https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}',
        ['azure.com'] = 'https://dev.azure.com/${owner}/_git/${repository}/pullrequestcreate?sourceRef=${branch_name}&targetRef=${target}',
      },
    }
    vim.keymap.set('n', '<leader>G', function()
      require('neogit').open()
    end, { desc = 'Open Neo[G]it View' })
  end,
}
