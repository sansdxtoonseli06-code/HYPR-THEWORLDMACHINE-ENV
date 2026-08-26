-- ============================================================
-- HYPRLAND LUA CONFIG
-- ============================================================
-- Hyprland 0.55+
-- Archivo: ~/.config/hypr/hyprland.lua
-- ============================================================


------------------
-- MONITORS
------------------

-- Fallback para cualquier monitor no especificado.
-- "preferred" usa la resolución/frecuencia preferidas.
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})


------------------
-- PROGRAMS
------------------

local terminal    = "kitty"
local fileManager = "dolphin"
local menu         = "rofi -show drun"


------------------
-- ENVIRONMENT
------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


------------------
-- AUTOSTART
------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("waypaper --restore")
end)


------------------
-- LOOK AND FEEL
------------------

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            active_border = {
                colors = {
                    "rgba(a020f0ff)",
                    "rgba(8839efcc)",
                },
                angle = 45,
            },

            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 10,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})


------------------
-- DWINDLE
------------------

hl.config({
    dwindle = {
        preserve_split = true,
    },
})


------------------
-- MASTER
------------------

hl.config({
    master = {
        new_status = "master",
    },
})


------------------
-- SCROLLING
------------------

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})


------------------
-- MISC
------------------

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
})


------------------
-- INPUT
------------------

hl.config({
    input = {
        kb_layout = "es",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})


------------------
-- TOUCHPAD GESTURES
------------------

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})


------------------
-- DEVICE EXAMPLE
------------------

-- Descomenta y cambia el nombre si realmente tienes este dispositivo.
--
-- hl.device({
--     name = "epic-mouse-v1",
--     sensitivity = -0.5,
-- })


------------------
-- ANIMATION CURVES
------------------

hl.curve("easeOutQuint", {
    type = "bezier",
    points = {
        { 0.23, 1 },
        { 0.32, 1 },
    },
})

hl.curve("easeInOutCubic", {
    type = "bezier",
    points = {
        { 0.65, 0.05 },
        { 0.36, 1 },
    },
})

hl.curve("linear", {
    type = "bezier",
    points = {
        { 0, 0 },
        { 1, 1 },
    },
})

hl.curve("almostLinear", {
    type = "bezier",
    points = {
        { 0.5, 0.5 },
        { 0.75, 1 },
    },
})

hl.curve("quick", {
    type = "bezier",
    points = {
        { 0.15, 0 },
        { 0.1, 1 },
    },
})


------------------
-- SPRING
------------------

hl.curve("easy", {
    type = "spring",
    mass = 1,
    stiffness = 238.1191,
    dampening = 24.21279333,
})


------------------
-- ANIMATIONS
------------------

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    spring = "easy",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    spring = "easy",
    style = "gnomed",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    bezier = "linear",
    style = "popin 87%",
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick",
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade",
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "linear",
    style = "fade",
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 1.21,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "zoomFactor",
    enabled = true,
    speed = 7,
    bezier = "quick",
})


------------------
-- KEYBINDINGS
------------------

local mainMod = "SUPER"


-- Terminal
hl.bind(
    mainMod .. " + T",
    hl.dsp.exec_cmd(terminal)
)


-- Close window
hl.bind(
    mainMod .. " + C",
    hl.dsp.window.close()
)


-- Exit Hyprland
hl.bind(
    mainMod .. " + M",
    function()
        hl.exec_cmd(
            "if command -v hyprshutdown >/dev/null 2>&1; then " ..
            "hyprshutdown; " ..
            "else " ..
            "hyprctl dispatch exit; " ..
            "fi"
        )
    end
)


-- File manager
hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd(fileManager)
)


-- Toggle floating
hl.bind(
    mainMod .. " + V",
    hl.dsp.window.float({
        action = "toggle",
    })
)


-- Rofi
hl.bind(
    mainMod .. " + SPACE",
    hl.dsp.exec_cmd(menu)
)


-- Pseudo tile
hl.bind(
    mainMod .. " + P",
    hl.dsp.window.pseudo()
)


-- Toggle split
hl.bind(
    mainMod .. " + J",
    hl.dsp.layout("togglesplit")
)


-- Fullscreen
hl.bind(
    "CTRL + " .. mainMod .. " + F",
    hl.dsp.window.fullscreen({
        action = "toggle",
    })
)


-- Screenshot region
hl.bind(
    "SHIFT + " .. mainMod .. " + S",
    hl.dsp.exec_cmd("hyprshot -m region")
)

-- Screenshot region
hl.bind(
    "SHIFT + " .. mainMod .. " + S",
    hl.dsp.exec_cmd("hyprshot -m region")
)

-- Screenshot region
hl.bind(
    mainMod .. " + M",
hl.dsp.exec_cmd("niripwmenu")
)




------------------
-- FOCUS
------------------

hl.bind(
    mainMod .. " + LEFT",
    hl.dsp.focus({
        direction = "left",
    })
)

hl.bind(
    mainMod .. " + RIGHT",
    hl.dsp.focus({
        direction = "right",
    })
)

hl.bind(
    mainMod .. " + UP",
    hl.dsp.focus({
        direction = "up",
    })
)

hl.bind(
    mainMod .. " + DOWN",
    hl.dsp.focus({
        direction = "down",
    })
)


------------------
-- WORKSPACES
------------------

for i = 1, 10 do
    local key = i % 10

    -- SUPER + 1..9 / 0
    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({
            workspace = i,
        })
    )

    -- SUPER + SHIFT + 1..9 / 0
    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({
            workspace = i,
        })
    )
end


------------------
-- SPECIAL WORKSPACE
------------------

hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({
        workspace = "special:magic",
    })
)


------------------
-- WORKSPACE SCROLLING
------------------

hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({
        workspace = "e+1",
    })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({
        workspace = "e-1",
    })
)


------------------
-- MOUSE WINDOW CONTROL
------------------

hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    {
        mouse = true,
    }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    {
        mouse = true,
    }
)


------------------
-- AUDIO
------------------

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ),
    {
        locked = true,
    }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ),
    {
        locked = true,
    }
)


------------------
-- BRIGHTNESS
------------------

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%+"
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%-"
    ),
    {
        locked = true,
        repeating = true,
    }
)


------------------
-- MEDIA
------------------

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    {
        locked = true,
    }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    {
        locked = true,
    }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    {
        locked = true,
    }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    {
        locked = true,
    }
)


------------------
-- WINDOW RULES
------------------

-- Ignore maximize requests.
local suppressMaximizeRule = hl.window_rule({
    name = "suppress-maximize-events",

    match = {
        class = ".*",
    },

    suppress_event = "maximize",
})


------------------
-- XWAYLAND DRAG FIX
------------------

hl.window_rule({
    name = "fix-xwayland-drags",

    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})


------------------
-- HYPRLAND RUN
------------------

hl.window_rule({
    name = "move-hyprland-run",

    match = {
        class = "hyprland-run",
    },

    move = {
        20,
        "monitor_h-120",
    },

    float = true,
})


------------------
-- OPTIONAL: SMART GAPS
------------------

-- Si quieres gaps 0 cuando solo hay una ventana,
-- puedes activar estas reglas.
--
-- hl.workspace_rule({
--     workspace = "w[tv1]",
--     gaps_out = 0,
--     gaps_in = 0,
-- })
--
-- hl.workspace_rule({
--     workspace = "f[1]",
--     gaps_out = 0,
--     gaps_in = 0,
-- })
--
-- hl.window_rule({
--     name = "no-gaps-wtv1",
--     match = {
--         float = false,
--         workspace = "w[tv1]",
--     },
--     border_size = 0,
--     rounding = 0,
-- })
--
-- hl.window_rule({
--     name = "no-gaps-f1",
--     match = {
--         float = false,
--         workspace = "f[1]",
--     },
--     border_size = 0,
--     rounding = 0,
-- })


-- ============================================================
-- END OF CONFIG
-- ============================================================
