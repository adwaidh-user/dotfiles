hl.window_rule({
    name = "Calculator",
    match = { class = "org.gnome.Calculator" },
    float = true,
    move = {106, 128},
    size = {700, 616},
})
-- Spotify
hl.window_rule({
    name = "Spotify in magic",
    match = { class = "Spotify" },
    float = true,
    move = {999, 72},
    size = {920, 645},
    workspace = "special:magic",
})
-- KDE Connect
hl.window_rule({
    name = "KDE Connect in magic",
    match = { class = "org.kde.kdeconnect.app"},
    float = true,
    move = {1, 67},
    size = {732, 422},
    workspace = "special:magic",
})
