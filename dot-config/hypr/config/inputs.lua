-- Input configuration

hl.config({
    input = {
        kb_layout = "de",
        kb_variant = "nodeadkeys",
        repeat_rate = 30,
        repeat_delay = 250,
        accel_profile = "flat",
    },
})

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down",       action = "close" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "left",       action = "float" })
