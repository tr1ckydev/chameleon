const std = @import("std");
const Chameleon = @import("chameleon.zig");
const Styles = @import("styles.zig");

pub inline fn wrapStyle(style: [2][]const u8) [2][]const u8 {
    return [_][]const u8{ "\u{001B}[" ++ style[0] ++ "m", "\u{001B}[" ++ style[1] ++ "m" };
}

inline fn toString(num: comptime_int) []const u8 {
    return std.fmt.comptimePrint("{}", .{num});
}

pub inline fn wrapAnsi16m(bg: bool, r: u8, g: u8, b: u8) []const u8 {
    return "\u{001B}[" ++ toString(if (bg) 48 else 38) ++ ";2;" ++ toString(r) ++ ";" ++ toString(g) ++ ";" ++ toString(b) ++ "m";
}

pub inline fn rgbFromHex(hex_code: []const u8) [3]u32 {
    const user_hex = if (hex_code[0] == '#') hex_code[1..] else hex_code;
    const hex_final = if (user_hex.len == 3) &[_]u8{ user_hex[0], user_hex[0], user_hex[1], user_hex[1], user_hex[2], user_hex[2] } else user_hex;
    const hex_int = comptime std.fmt.parseInt(u32, hex_final, 16) catch |err| @compileError("unable to parse hex due to " ++ @errorName(err));
    return [_]u32{
        (hex_int >> 16) & 0xFF, // red
        (hex_int >> 8) & 0xFF, // green
        hex_int & 0xFF, // blue
    };
}

test toString {
    try std.testing.expectEqual("123", toString(123));
}

test rgbFromHex {
    try std.testing.expectEqual([_]u32{ 0xFF, 0xAA, 0x00 }, rgbFromHex("FFAA00"));
}
