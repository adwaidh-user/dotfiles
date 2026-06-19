-- local devices = require "devices"
---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "ALT"

local progs = require("programs")
-- local touchpad_enabled = true

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(progs.terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(progs.fileManager))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd(progs.fileManager_tty))
hl.bind("SUPER + B", hl.dsp.exec_cmd(progs.browser))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd(progs.browser_private))
hl.bind("SUPER + D", hl.dsp.exec_cmd(progs.menu))
hl.bind("SUPER + M", hl.dsp.exec_cmd(progs.mail))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("hyprpicker"))

-- local closeWindowBind = hl.bind("SUPER + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
-- Close & kill
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())
-- logout hyprland
hl.bind(mainMod .. " + SUPER + Q", hl.dsp.exec_cmd(progs.powermenu .. " --logout"))
-- Shutdown & restart
hl.bind("SUPER + Q", hl.dsp.exec_cmd(progs.powermenu .. " --shutdown"))
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd(progs.powermenu .. " --reboot"))
hl.bind("XF86PowerOff", hl.dsp.exec_raw(progs.powermenu))

-- tiling modes
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle"}))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle"}))

-- Move window focus with mainMod + WASD keys
hl.bind(mainMod .. " + A",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + D",  hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + W",  hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + S",  hl.dsp.focus({ direction = "down" }))

-- Move window with mainMod + WASD keys
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ direction = "down", group_aware = true }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + minus",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + R", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + E",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move windows with mainMod + HJKL keys
hl.bind(mainMod .. " + H",  hl.dsp.window.move({ x = -15, y = 0, relative = true}), { repeating = true })
hl.bind(mainMod .. " + J",  hl.dsp.window.move({ x = 0, y = 15, relative = true}), { repeating = true })
hl.bind(mainMod .. " + K",  hl.dsp.window.move({ x = 0, y = -15, relative = true}), { repeating = true })
hl.bind(mainMod .. " + L",  hl.dsp.window.move({ x = 15, y = 0, relative = true}), { repeating = true })

-- Resize window with mainMod + SHIFT + HJKL keys
hl.bind(mainMod .. " + SHIFT + H",  hl.dsp.window.resize({ x = -15, y = 0, relative = true}), { repeating = true })
hl.bind(mainMod .. " + SHIFT + J",  hl.dsp.window.resize({ x = 0, y = 15, relative = true}), { repeating = true })
hl.bind(mainMod .. " + SHIFT + K",  hl.dsp.window.resize({ x = 0, y = -15, relative = true}), { repeating = true })
hl.bind(mainMod .. " + SHIFT + L",  hl.dsp.window.resize({ x = 15, y = 0, relative = true}), { repeating = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),       { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),      { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_raw(os.getenv("HYPR_CONFIG_PATH") .. "mic-toggle.sh"),  { locked = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -n1 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -n1 set 5%-"), { locked = true, repeating = true })

-- hl.bind("XF86TouchpadToggle", function ()
--     devices.touchpad = not devices.touchpad
--
--     hl.notification.create({
--         text = "Touchpad enabled: " .. devices.touchpad,
--     })
--     hl.device({ name = "asue1306:00-04f3:3284-touchpad", enabled = devices.touchpad })
-- end)

hl.bind("Print", hl.dsp.exec_raw(os.getenv("ROFI_SCRIPT_PATH") .. "Screenshot/screenshot.sh"))

-- Requires playerctl
-- hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
