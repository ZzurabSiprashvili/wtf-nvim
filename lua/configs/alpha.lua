local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "                        ,----,                   _.--,-```-.    ",
  "                      ,/   .`|                  /    /      '.  ",
  "           .---.    ,`   .'  :   ,---,.        /  ../         ; ",
  "          /. ./|  ;    ;     / ,'  .' |        \\  ``\\  .``-    '",
  "      .--'.  ' ;.'___,/    ,',---.'   |         \\ ___\\/    \\   :",
  "     /__./ \\ : ||    :     | |   |   .'               \\    :   |",
  " .--'.  '   \\' .;    |.';  ; :   :  :                 |    ;  . ",
  "/___/ \\ |    ' '`----'  |  | :   |  |-,              ;   ;   :  ",
  ";   \\  \\;      :    '   :  ; |   :  ;/|             /   :   :   ",
  " \\   ;  `      |    |   |  ' |   |   .'             `---'.  |   ",
  "  .   \\    .\\  ;    '   :  | '   :  '                `--..`;    ",
  "   \\   \\   ' \\ |    ;   |.'  |   |  |              .--,_        ",
  "    :   '  |--'     '---'    |   :  \\              |    |`.     ",
  "     \\   \\ ;                 |   | ,'              `-- -`, ;    ",
  "      '---'                  `----'                  '---`'     ",
}

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find Files", ":Telescope find_files<CR>"),
  dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
  dashboard.button("g", "  LazyGit", ":LazyGit<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

require("alpha").setup(dashboard.opts)
