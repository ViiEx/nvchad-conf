local status_ok, copilot = pcall(require, "copilot")

if not status_ok then
  return
end

local opts = {
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<C-c>",
    },
  },
}

copilot.setup(opts)
