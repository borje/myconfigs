-- applications menu
require('freedesktop.utils')
freedesktop.utils.terminal = terminal  -- default: "xterm"
freedesktop.utils.icon_theme = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)
require('freedesktop.menu')

menu_items = freedesktop.menu.new()
myawesomemenu = {
    { "manual", terminal .. " -e man awesome", freedesktop.utils.lookup_icon({ icon = 'help' }) },
    { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua", freedesktop.utils.lookup_icon({ icon = 'package_settings' }) },
    { "restart", awesome.restart, freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
    { "quit", function() os.execute("gnome-session-quit") end, freedesktop.utils.lookup_icon({ icon = 'gtk-quit' }) }
}
table.insert(menu_items, { "awesome", myawesomemenu, beautiful.awesome_icon })
table.insert(menu_items, { "open terminal", terminal, freedesktop.utils.lookup_icon({icon = 'terminal'}) })


mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
menu = mymainmenu })

poweroffmenu = {
    { "Suspend", "sudo pm-suspend" },
    { "Hibernate", "sudo pm-hibernate"},
}

mymainmenu = awful.menu({ items = { 
    { "Programs", menu_items},
    { "Power off", poweroffmenu} 
}, width = 150 })
