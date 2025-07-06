return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local db = require("dashboard")
      db.setup {
        theme = "doom",
        config = {
          header = {
            [[ _   _            _                                    ]],
            [[| | | | __ _  ___| | _____ _ __ ___   __ _ _ __ ___   ]],
            [[| |_| |/ _` |/ __| |/ / _ \ '_ ` _ \ / _` | '_ ` _ \  ]],
            [[|  _  | (_| | (__|   <  __/ | | | | | (_| | | | | | | ]],
            [[|_| |_|\__,_|\___|_|\_\___|_| |_| |_|\__,_|_| |_| |_| ]],
            [[                                                     ]],
            [[                 H A C K E R M A N                    ]],
          },
          center = {
            { icon = "  ", desc = "Find File", action = "Telescope find_files" },
            { icon = "  ", desc = "Recent Files", action = "Telescope oldfiles" },
            { icon = "  ", desc = "File Browser", action = "Telescope file_browser" },
          },
          footer = { "🚀 Ready to Hack" },
        },
      }
    end,
  },
}

