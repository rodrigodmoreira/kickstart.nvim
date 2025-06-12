local function execute_file()
  local filename = vim.fn.expand '%:p'
  local extension = vim.fn.expand '%:e'

  local commands = {
    ['py'] = 'python3 ' .. filename,
    ['sh'] = 'bash ' .. filename,
    ['js'] = 'node ' .. filename,
    ['lua'] = 'lua ' .. filename,
    ['c'] = 'g++ ' .. filename .. ' -o output && ./output && rm ./output',
    ['cpp'] = 'g++ ' .. filename .. ' -o output && ./output && rm ./output',
    ['p8'] = 'pico8 ' .. filename,
  }

  if commands[extension] then
    vim.cmd('!' .. commands[extension])
  else
    print('Unknown extension: ' .. extension)
  end
end

-- Set as function as command
vim.api.nvim_create_user_command('Run', execute_file, {})

-- Set hotkey to command
vim.keymap.set('n', '<C-c>', ':Run<CR>', { noremap = true, silent = true })
