local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

--dashboard.section.header.val = {
--    "⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⡶⣶⣶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--	"⠀⠀⠀⠀⠀⢠⣴⡿⠫⠓⠿⠛⠉⠀⢀⣙⠷⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--	"⠀⠀⠀⠀⠀⣾⠏⣴⠕⢁⠀⠀⠀⢺⣿⣿⣧⠀⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--	"⠀⠀⠀⠀⢸⣯⡾⢡⠣⠃⠀⠀⠒⢘⣿⣿⣿⣇⠸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--	"⠀⠀⠀⠀⠺⣿⣴⣧⡄⢀⣀⣰⣶⣶⣿⣻⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--	"⠀⠀⠀⠀⢺⣿⣿⣿⠛⠐⠀⠈⠉⢹⣏⣧⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--	"⠀⠀⠀⠀⠘⣿⣿⣿⣆⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀██╗  ██╗███████╗██╗     ██╗      ██████╗     ████████╗██╗  ██╗███████╗██████╗ ███████╗",
--	"⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⡿⠀⠁⠛⢻⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ╚══██╔══╝██║  ██║██╔════╝██╔══██╗██╔════╝",
--	"⠀⠀⠀⠀⠀⠀⠿⣿⣿⣾⡴⡂⠀⠀⣙⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀███████║█████╗  ██║     ██║     ██║   ██║       ██║   ███████║█████╗  ██████╔╝█████╗  ",
--	"⠀⠀⠀⠀⠀⠀⣀⣿⣿⣟⠀⠀⠹⣻⣿⣿⡿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀██╔══██║██╔══╝  ██║     ██║     ██║   ██║       ██║   ██╔══██║██╔══╝  ██╔══██╗██╔══╝  ",
--	"⣠⣴⣶⣶⣿⣿⣿⡯⠻⣿⣇⠀⠀⢻⣿⣿⢳⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀⠀██║  ██║███████╗███████╗███████╗╚██████╔╝       ██║   ██║  ██║███████╗██║  ██║███████╗",
--	"⣿⣿⣿⣿⣿⡏⣿⣇⠀⠈⠻⣷⢴⠿⠈⢡⣿⣿⠋⣾⣿⣿⣿⣿⣶⣶⣶⣄⠀⠀╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝        ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝",
--}

--dashboard.section.footer.val = {
--"                                                               ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠤⠀⡀⠤⠤⢀⣀⠀⣀⡠⠤⠒⠊⠉⠉⠒⢤⣀⠤⣒⠊⠉⠉⠀⠀⠀⠀",
--"                                                               ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢇⠀⠀⠀⠀⠀⠀⣀⣠⡴⠋⠀⠀⡰⠁⠀⢀⠀⠈⠉⢢⣤⠶⠊⠙⠛⠋⢳⠆⠀⠢⡈⠣⡀⠀⠀⠀⠀⠀",
--"                                                               ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣧⠀⠀⣀⠔⢋⣥⠊⣰⡇⠀⢠⠃⠀⠀⣾⡄⠀⠀⠈⠈⠳⣄⣀⣠⡴⣾⣄⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀",
--"                                                               ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⠊⠁⢰⢁⠇⠐⣿⠁⠀⠀⠀⠀⠀⣿⠃⠀⠀⠀⡇⠀⠈⢿⣿⣷⡏⢻⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀",
--"                                                               ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⡻⡿⣿⣦⣌⡌⠀⠀⢻⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢰⠀⠀⠈⣿⣼⣇⠀⠙⢿⣷⣥⠀⠀⠀⠀⠀⠀",
--"                                                               ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡎⢠⣿⠃⣨⣿⢿⠃⠀⠀⢸⡀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⢣⠀⡼⠉⠹⢿⣧⠀⠸⣿⣿⣄⠀⠀⠀⠀⠀",
--"                                                               ⠀⠀⠀⠀⠀⠀⠀⢠⠏⢹⠁⣮⡇⢠⣿⣟⡏⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠈⣷⠀⢀⢤⣤⠀⠻⡷⢠⠇⢸⡏⣆⣀⢿⣿⣿⣷⡀⠀⠀⠀",
--"                                                               ⠀⠀⠀⠀⠀⢀⡔⠁⢠⣿⠀⣿⣇⠀⡏⢀⠃⢀⣀⣀⣀⣷⡀⢀⠀⠀⠀⢠⣿⣙⣧⠾⢿⣧⠀⠰⣸⠀⣸⢡⡶⠎⣿⣿⣿⣿⠀⢰⡄⠀",
--" ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗         ⠀⠀⠀⠀⠀⣼⡄⠀⢸⣿⠀⢸⣶⣶⣃⡎⠸⣿⣿⣧⣼⡧⡟⠸⠀⠀⠀⠈⢿⡯⢭⠭⠞⣻⠀⠀⡟⣶⠟⣛⡓⢠⣿⣿⣿⣿⠀⠘⣿⡄",
--"██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║         ⠀⠀⠀⠀⢾⠠⣧⠀⠀⡇⢃⠘⡙⢎⣛⡇⠀⠹⡗⠒⠚⣻⠃⠀⡆⠀⠀⠀⠀⠈⠑⠒⠊⠁⠀⣰⢟⣡⠾⣯⢁⣿⣿⣿⣿⣿⠀⠀⣿⣿",
--"██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║         ⠀⠀⠀⡔⠺⠀⠹⣦⠀⠱⡜⡆⢣⠸⡿⣷⡄⠀⠙⠓⠈⠁⠀⠀⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡿⢻⡆⣸⣿⣿⣿⣿⣿⣧⠀⠟⠛",
--"██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║         ⢀⡤⠔⠓⡄⡆⠀⠹⣧⠠⡘⢿⡈⠳⢍⣩⣾⣦⣄⣀⠀⠀⠀⠀⠈⡆⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⠀⢸⠀⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀",
--"╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗    ⢯⠀⠀⠀⢱⠘⢄⠀⠙⢧⠘⡄⠁⢀⠈⠛⢿⡄⠹⣿⣿⣆⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣽⡄⢸⢸⣿⣿⣿⣿⣿⠁⣿⠇⠀⠀",
--" ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ⠀⠣⡀⠀⢸⢆⠀⢳⣄⠀⠀⠈⢆⠈⢆⠀⠈⠻⡆⢻⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⡇⠈⣼⣿⣿⣿⣿⣿⣴⡿⠀⠀⠀",
--"██╗  ██╗███████╗███╗   ██╗ ██████╗ ██████╗ ██╗                 ⠀⠀⠁⠀⠘⢌⢣⡀⠉⢷⣄⠀⠈⠳⡀⠳⣄⠀⠙⡌⣿⣆⣸⡄⠀⠀⢀⣀⠀⡤⠀⠄⠀⠸⣿⣿⣿⠿⡀⠹⠿⢿⣿⣿⣿⡟⠁⠀⠀⠀",
--"██║ ██╔╝██╔════╝████╗  ██║██╔═══██╗██╔══██╗██║                 ⠀⠀⠀⠈⠱⡀⠙⢜⣦⡀⠙⢆⠀⠀⠘⠦⡘⢿⣆⠙⣬⢻⢻⣇⠀⡄⠈⠘⠀⠀⠀⠀⠀⠀⢹⣿⠏⠐⢧⠀⠀⠀⢹⣠⡏⠀⠀⠀⠀⠀",
--"█████╔╝ █████╗  ██╔██╗ ██║██║   ██║██████╔╝██║                 ⠀⠀⠀⠀⠀⠈⠢⡀⠉⠻⣦⠀⠣⠀⠀⠀⢹⣦⠙⣿⣿⠈⢧⣹⡀⢱⠀⠈⠀⠀⠀⠂⠀⡄⢾⣯⣶⣤⣬⢧⣤⡴⠊⡝⠀⠀⣠⠀⠀⠀",
--"██╔═██╗ ██╔══╝  ██║╚██╗██║██║   ██║██╔══██╗██║                 ⠀⠀⠂⠀⠀⠀⠀⠈⠢⡀⠀⠑⠦⡀⠀⠐⠻⣇⣣⡈⢻⡆⠀⠙⡟⠀⠀⠀⠀⠀⢂⠀⢳⣷⠀⢻⣿⣿⣿⣾⣿⠷⠊⠀⢀⣼⡟⠀⠀⠀",
--"██║  ██╗███████╗██║ ╚████║╚██████╔╝██████╔╝██║                 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢄⠀⠀⠀⠀⠀⠀⠀⠙⢷⣄⠓⠀⠀⠱⡀⠐⠆⢘⡠⠤⠒⠒⠘⢦⡬⠉⠉⠉⠉⠀⢀⡠⠒⠁⡜⠀⠀⠀⠀",
--"╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚═╝                 ⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠀⠀⠀⠑⢴⣎⠁⠀⠀⠀⠀⠀⠀⠑⠦⣄⣀⡀⡀⣀⡠⠤⠚⠀⠀⠀⠀⠀",
--}


dashboard.section.header.val = {
    " ██╗ ██████╗         ██╗  ██╗ ██████╗ ███╗   ███╗███████╗",
    "███║██╔═████╗        ██║  ██║██╔═══██╗████╗ ████║██╔════╝",
    "╚██║██║██╔██║        ███████║██║   ██║██╔████╔██║█████╗",
    " ██║████╔╝██║        ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝",
    " ██║╚██████╔╝        ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗",
    " ╚═╝ ╚═════╝         ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝",
    "",
    "██████╗  ██████╗     ███████╗██╗    ██╗███████╗███████╗████████╗",
    "╚════██╗██╔═████╗    ██╔════╝██║    ██║██╔════╝██╔════╝╚══██╔══╝",
    " █████╔╝██║██╔██║    ███████╗██║ █╗ ██║█████╗  █████╗     ██║",
    "██╔═══╝ ████╔╝██║    ╚════██║██║███╗██║██╔══╝  ██╔══╝     ██║",
    "███████╗╚██████╔╝    ███████║╚███╔███╔╝███████╗███████╗   ██║",
    "╚══════╝ ╚═════╝     ╚══════╝ ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝",
}

dashboard.section.footer.val = {
    "██████╗  ██████╗      ██████╗  ██████╗ ████████╗ ██████╗      ██╗ ██████╗",
    "╚════██╗██╔═████╗    ██╔════╝ ██╔═══██╗╚══██╔══╝██╔═══██╗    ███║██╔═████╗",
    " █████╔╝██║██╔██║    ██║  ███╗██║   ██║   ██║   ██║   ██║    ╚██║██║██╔██║",
    " ╚═══██╗████╔╝██║    ██║   ██║██║   ██║   ██║   ██║   ██║     ██║████╔╝██║",
    "██████╔╝╚██████╔╝    ╚██████╔╝╚██████╔╝   ██║   ╚██████╔╝     ██║╚██████╔╝",
    "╚═════╝  ╚═════╝      ╚═════╝  ╚═════╝    ╚═╝    ╚═════╝      ╚═╝ ╚═════╝",
}

dashboard.section.buttons.val = {
    dashboard.button("<Leader>pv", "󰉋 File Explorer"),
    dashboard.button("<Leader>ff", "  Find File"),
    dashboard.button("q", "󰩈 Quit", ":qa<cr>")
}

alpha.setup(dashboard.opts)
