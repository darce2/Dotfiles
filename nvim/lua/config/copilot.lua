vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', {
  expr = true,
  silent = true,
  replace_keycodes = false,
  desc = "Accept Copilot suggestion",
})
