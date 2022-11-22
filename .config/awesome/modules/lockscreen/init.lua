local awful = require("awful")

local function lock_screen_show()
  awful.spawn.with_shell("sh i3lock-extra.sh -s -o $HOME/Pictures/lock-overlay.png -b")
  -- awful.spawn.with_shell("sh i3lock-extra.sh -i $HOME/.active-wallpaper/wallpaper.jpg -o $HOME/Pictures/lock-overlay.png")
end

return lock_screen_show
