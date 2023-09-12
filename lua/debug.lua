-- fetch the dap plugin
local dap = require('dap')


-- Setup DapUI
local dapui = require('dapui')
-- set it up see more configs in their repo
dapui.setup()


-- dap fires events, we can listen on them to open UI on certain events
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


-- Add adapter to delve
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  } 
}






-- setup cpptools adapter
   dap.adapters.cpptools = {
     type = 'executable';
     name = "cpptools",
     command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
     args = {},
     attach = {
       pidProperty = "processId",
       pidSelect = "ask"
     },
   }

   -- this configuration should start cpptools and the debug the executable main in the current directory when executing :DapContinue
   dap.configurations.cpp = {
     {
       name = "Launch",
       type = "cpptools",
       request = "launch",
       program = '${workspaceFolder}/main',
       cwd = '${workspaceFolder}',
       stopOnEntry = true,
       args = {},
       runInTerminal = false,
     },
   }
