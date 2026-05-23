-- Tsukasa's Hyprlua Config

-- Monitors

hl.monitor({
    output   = "HDMI-A-2",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


---- My Programmes

-- Set programs that you use
local terminal    = "foot"
local fileManager = "dolphin"
local menu        = "wofi --show drun"


-- Startup 


 hl.on("hyprland.start", function () 
   hl.exec_cmd("waybar & swaybg -i ~/.config/hypr/walls/1.jpg & swayosd-server" )
 end)


-- Environmental Variables


hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")



-- Look + feel

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 5,
        border_size = 1,

        col = {
            active_border   = "rgba(ffffffee)",
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding       = 20,
        rounding_power = 5,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 1,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("ios",            { type = "bezier", points = { {0.2, 0},     {0.1, 1}     } })
hl.curve("slight",         { type = "bezier", points = { {0.18, 0.95}, {0.22, 1.03}  } })


-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "slight" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 5, spring = "easy", bezier = "slight" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 5, bezier = "slight", style = "slide"  })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 5, bezier = "slight", style = "slide" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 5, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 7, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "slide" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "slight" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 5, bezier = "slight", style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 5, bezier = "slight", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 5, bezier = "slight", style = "slide" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 6,    bezier = "quick" })

hl.config({
    dwindle = {
        preserve_split = true, 
    },
})

hl.config({
    master = {
        new_status = "dwindle",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

-- Misc 

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


-- Input

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
	repeat_rate  = 50,
        repeat_delay = 150,

        sensitivity = 0, 

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


-- Binds 

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal), {repeating = true})
local closeWindowBind = hl.bind(mainMod .. " + w", hl.dsp.window.close(), {repeating = true})
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + h",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + h",  hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k",    hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j",  hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"),               { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"),      	       { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),         { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),       { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("swayosd-client --brightness raise"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("swayosd-client --brightness lower"),                  { locked = true, repeating = true })
hl.bind("Print", hl.dsp.exec_cmd("sh -c 'grim -g \"$(slurp)\" ~/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png'"))


-- Window stuff + workspaces
--------------------------------


local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

 local overlayLayerRule = hl.layer_rule({
     name  = "no-anim-overlay",
     match = { namespace = "wofi" },
     blur = true
 })

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
