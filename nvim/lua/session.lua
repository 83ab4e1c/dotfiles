local fn, api, loop = vim.fn, vim.api, vim.loop
local session_directory = '~/.cache/nvim/session'
local is_windows = #vim.fn.windowsversion() > 0
local path_sep = is_windows and '\\' or '/'
local session = {}
local home = loop.os_homedir()

local msg_dict = {
    save = 'Session %s is now persistent',
    load = 'Loaded %s session',
    load_failed = 'The session %s does not exist',
    deleted = 'Session %s deleted',
    delete_failed = 'The session %s does not exist',
}

local project_name = function()
  local cwd = fn.resolve(fn.getcwd())
  cwd = fn.substitute(cwd, '^' .. home .. path_sep, '', '')
  if is_windows then
    cwd = fn.fnamemodify(cwd, [[:p:gs?\?_?]])
    cwd = (string.gsub(cwd, 'C:', ''))
  else
    cwd = fn.fnamemodify(cwd, [[:p:gs?/?_?]])
  end
  cwd = fn.substitute(cwd, [[^\.]], '', '')
  return cwd
end

if is_windows then
  session_directory = string.gsub(session_directory, '/', '\\')
end

function session.session_save(name)
  if fn.isdirectory(session_directory) == 0 then
    fn.mkdir(session_directory, 'p')
  end

  local file_name = name == nil and project_name() or name
  local file_path = session_directory .. path_sep .. file_name .. '.vim'
  api.nvim_command('mksession! ' .. fn.fnameescape(file_path))
  vim.v.this_session = file_path

  vim.notify(string.format(msg_dict.save, file_name))
end

local function convert_home_base()
  if session_directory:find('^~/') then
    session_directory = vim.fs.normalize(session_directory)
  end
end

function session.session_load(name)
  convert_home_base()
  local file_path = (name and #name > 0) and name
    or session_directory .. path_sep .. project_name() .. '.vim'

  if vim.v.this_session ~= '' and fn.exists('g:SessionLoad') == 0 then
    api.nvim_command('mksession! ' .. fn.fnameescape(vim.v.this_session))
  end

  if fn.filereadable(file_path) == 1 then
    vim.cmd([[ noautocmd silent! %bwipeout!]])
    api.nvim_command('silent! source ' .. file_path)

    if vim.opt.laststatus:get() == 0 then
      vim.opt.laststatus = 2
    end

    vim.notify(string.format(msg_dict.load, file_path))
    return
  end

  vim.notify(string.format(msg_dict.load_failed, file_path))
end

function session.session_exists(name)
  local file_name = name == nil and project_name() or name
  local file_path = session_directory .. path_sep .. file_name .. '.vim'

  return fn.filereadable(file_path) == 1
end

function session.session_delete(name)
  local file_name = not name and project_name() or name
  local file_path = session_directory .. path_sep .. file_name .. '.vim'

  if fn.filereadable(file_path) == 1 then
    fn.delete(file_path)
    vim.notify(string.format(msg_dict.deleted, file_name))
    return
  end

  vim.notify(string.format(msg_dict.delete_failed, file_name))
end


function session.session_list()
  return vim.split(fn.globpath(session_directory, '*.vim'), '\n')
end

api.nvim_create_user_command('SessionSave', function()
  session.session_save()
end, {
  nargs = '?',
  complete = session.session_list,
})

api.nvim_create_user_command('SessionLoad', function(args)
  session.session_load(args.args)
end, {
  nargs = '?',
  complete = session.session_list,
})

api.nvim_create_user_command('SessionDelete', function()
  session.session_delete()
end, {
  nargs = '?',
  complete = session.session_list,
})
