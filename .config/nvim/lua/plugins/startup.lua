return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
     ██╗ ██████╗ ██████╗  ██████╗ ███████╗████████╗
     ██║██╔═══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝
     ██║██║   ██║██████╔╝██║  ███╗█████╗     ██║   
██   ██║██║   ██║██╔══██╗██║   ██║██╔══╝     ██║   
╚█████╔╝╚██████╔╝██████╔╝╚██████╔╝███████╗   ██║   
 ╚════╝  ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝   ╚═╝   
 ]],
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, gap = 1, padding = 1 },
        {
          pane = 2,
          section = "terminal",
          cmd = "colorscript -e square",
          height = 5,
          padding = 1,
        },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = true,
          cmd = "hub status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
      },
    },
  },
}
