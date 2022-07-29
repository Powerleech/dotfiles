local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")
local watch = require("awful.widget.watch")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi
local path_to_icons = "/usr/share/icons/Arc/actions/22/"
local mail = {}
local email_widget = wibox.widget {
  id = "textbox",
  font = "Play 9",
  widget = wibox.widget.textbox
}

local email_icon = wibox.widget {
    widget = wibox.widget.imagebox,
    Image = path_to_icons .. "/mail-read.png", 
    resize = true
}

watch(
    "python /home/powerleech/.config/awesome/widgets/email-widget/count_unread_emails.py", 20,
    function(_, stdout)
        local unread_emails_num = tonumber(stdout) or 0
        if (unread_emails_num > 0) then
            email_icon:set_image(path_to_icons .. "/mail_new.png")
	        email_widget:set_markup(stdout)
        elseif (unread_emails_num == 0) then
            email_icon:set_image(path_to_icons .. "/mail-read.png")
            email_widget:set_markup("")
        end
    end
)


local function show_emails()
    awful.spawn.easy_async([[bash -c 'python /home/powerleech/.config/awesome/widgets/email-widget/read_unread_emails.py']],
        function(stdout)
            naughty.notify{
                text = stdout,
                title = "Unread Emails",
                timeout = 5, hover_timeout = 0.5,
                width = 400,
            }
        end
    )
end

email_icon:connect_signal("mouse::enter", function() show_emails() end)
mail.icon = email_icon
mail.widget = email_widget
return mail 
