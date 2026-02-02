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
	["github.com"] = {
      pull_request = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
      commit = "https://github.com/${owner}/${repository}/commit/${oid}",
      tree = "https://${host}/${owner}/${repository}/tree/${branch_name}",
    },
	["github.kensho.com"] = {
      pull_request = "https://github.kensho.com/${owner}/${repository}/compare/${branch_name}?expand=1",
      commit = "https://github.com/${owner}/${repository}/commit/${oid}",
      tree = "https://${host}/${owner}/${repository}/tree/${branch_name}",
    },
    ["bitbucket.org"] = {
      pull_request = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
      commit = "https://bitbucket.org/${owner}/${repository}/commits/${oid}",
      tree = "https://bitbucket.org/${owner}/${repository}/branch/${branch_name}",
    },
    ["gitlab.com"] = {
      pull_request = "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
      commit = "https://gitlab.com/${owner}/${repository}/-/commit/${oid}",
      tree = "https://gitlab.com/${owner}/${repository}/-/tree/${branch_name}?ref_type=heads",
    },
    ["azure.com"] = {
      pull_request = "https://dev.azure.com/${owner}/_git/${repository}/pullrequestcreate?sourceRef=${branch_name}&targetRef=${target}",
      commit = "",
      tree = "",
    },
    ["codeberg.org"] = {
      pull_request = "https://${host}/${owner}/${repository}/compare/${branch_name}",
      commit = "https://${host}/${owner}/${repository}/commit/${oid}",
      tree = "https://${host}/${owner}/${repository}/src/branch/${branch_name}",
    },},
    }
    vim.keymap.set('n', '<leader>G', function()
      require('neogit').open()
    end, { desc = 'Open Neo[G]it View' })
  end,
}
