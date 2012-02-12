poweroffmenu = {
    { "Suspend", "sudo pm-suspend" },
    { "Hibernate", "sudo pm-hibernate"},
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "Debian", debian.menu.Debian_menu.Debian },
                                    { "Power off", poweroffmenu}
                                  }
                        })
