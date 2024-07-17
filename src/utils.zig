const fmt = @import("std").fmt;
const Chameleon = @import("chameleon.zig").Chameleon;
const Styles = @import("styles.zig").Styles;

pub inline fn wrapStyle(style: [2][]const u8) [2][]const u8 {
    return [_][]const u8{ "\u{001B}[" ++ style[0] ++ "m", "\u{001B}[" ++ style[1] ++ "m" };
}

fn toString(comptime num: comptime_int) []const u8 {
    return fmt.comptimePrint("{}", .{num});
}

pub fn wrapAnsi16m(bg: bool, r: u8, g: u8, b: u8) []const u8 {
    return "\u{001B}[" ++ toString(if (bg) 48 else 38) ++ ";2;" ++ toString(r) ++ ";" ++ toString(g) ++ ";" ++ toString(b) ++ "m";
}

pub fn rgbFromHex(comptime hex: []const u8) [3]u32 {
    const hexCode = if (hex[0] == '#') hex[1..] else hex;
    const hexInt = fmt.parseInt(u32, hexCode, 16) catch |err| @compileError("unable to parse hex due to " ++ @errorName(err));
    return [_]u32{
        (hexInt >> 16) & 0xFF,
        (hexInt >> 8) & 0xFF,
        hexInt & 0xFF,
    };
}

pub inline fn getStyle(cham: Chameleon, style_name: []const u8) Chameleon {
    const style = wrapStyle(@field(Styles, style_name));
    comptime return .{
        .level = cham.level,
        .visible_always = cham.visible_always,
        .open = cham.open ++ style[0],
        .close = cham.close ++ style[1],
    };
}
