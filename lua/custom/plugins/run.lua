return {
  {
    'rodrigo-run-code',
    dir = vim.fn.stdpath 'config', -- Indica que é um plugin local
    config = function()
      local function execute_file()
        vim.cmd 'write'
        local filename = vim.fn.expand '%:p'
        local extension = vim.fn.expand '%:e'

        local commands = {
          ['py'] = 'python3 ' .. filename,
          ['sh'] = 'bash ' .. filename,
          ['js'] = 'node ' .. filename,
          ['lua'] = 'lua ' .. filename,
          ['c'] = 'g++ ' .. filename .. ' -o out && ./out',
          ['cpp'] = 'g++ ' .. filename .. ' -o out && ./out',
          ['p8'] = '/home/rodrigo/apps/pico-8/pico8 -run ' .. filename,
        }

        if commands[extension] then
          vim.cmd('!' .. commands[extension])
        else
          print('Extensão não suportada: ' .. extension)
        end
      end

      vim.api.nvim_create_user_command('Run', execute_file, {})
    end,

    keys = {
      { '<leader>r', ':Run<CR>', desc = 'Run code', silent = true },
    },
  },
}
