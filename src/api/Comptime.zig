const std = @import("std");
const Styles = @import("../styles.zig");
const Utils = @import("../utils.zig");
const Chameleon = @This();

open: []const u8 = "",
close: []const u8 = "",
preset: bool = false,

/// Returns the formatted text.
pub inline fn fmt(self: *Chameleon, comptime text: []const u8) []const u8 {
    defer self.removeAll();
    return self.open ++ text ++ self.close;
}

/// Print the formatted text to a `File` writer.
pub inline fn print(self: *Chameleon, writer: std.fs.File.Writer, comptime text: []const u8, args: anytype) !void {
    defer self.removeAll();
    try writer.print(self.fmt(text), args);
}

/// Print the formatted text to stdout.
pub inline fn printOut(self: *Chameleon, comptime format: []const u8, args: anytype) !void {
    return self.print(std.io.getStdOut().writer(), format, args);
}

/// Print the formatted text to stderr.
pub inline fn printErr(self: *Chameleon, comptime format: []const u8, args: anytype) !void {
    return self.print(std.io.getStdErr().writer(), format, args);
}

pub inline fn addStyle(self: *Chameleon, comptime style_name: []const u8) *Chameleon {
    const style = Utils.wrapStyle(@field(Styles, style_name));
    self.open = self.open ++ style[0];
    self.close = style[1] ++ self.close;
    return self;
}

inline fn removeAll(self: *Chameleon) void {
    if (self.preset) return;
    self.open = "";
    self.close = "";
}

pub inline fn reset(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bold(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn dim(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn italic(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn underline(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn blink(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn inverse(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn hidden(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn strikethrough(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn doubleUnderline(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn overline(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn black(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn red(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn green(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn yellow(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn blue(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn magenta(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn cyan(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn white(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn blackBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn gray(self: *Chameleon) *Chameleon {
    return blackBright(self);
}

pub inline fn grey(self: *Chameleon) *Chameleon {
    return blackBright(self);
}

pub inline fn redBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn greenBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn yellowBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn blueBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn magentaBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn cyanBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn whiteBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgBlack(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgRed(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgGreen(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgYellow(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgBlue(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgMagenta(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgCyan(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgWhite(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgBlackBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgGray(self: *Chameleon) *Chameleon {
    return bgBlackBright(self);
}

pub inline fn bgGrey(self: *Chameleon) *Chameleon {
    return bgBlackBright(self);
}

pub inline fn bgRedBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgGreenBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgYellowBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgBlueBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgMagentaBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgCyanBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgWhiteBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

/// Set the foreground color to the rgb color values.
pub inline fn rgb(self: *Chameleon, comptime r: u8, comptime g: u8, comptime b: u8) *Chameleon {
    self.open = self.open ++ Utils.wrapAnsi16m(false, r, g, b);
    self.close = "\u{001B}[39m" ++ self.close;
    return self;
}

/// Set the background color to the rgb color values.
pub inline fn bgRgb(self: *Chameleon, comptime r: u8, comptime g: u8, comptime b: u8) *Chameleon {
    self.open = self.open ++ Utils.wrapAnsi16m(true, r, g, b);
    self.close = "\u{001B}[49m" ++ self.close;
    return self;
}

/// Set the foreground color to the hex color code.
///
/// NOTE:
/// - The `#` prefix is optional.
/// - Hex triplets are allowed. (e.g. `#FFAA00` is equivalent to `#FA0`)
///
pub inline fn hex(self: *Chameleon, comptime hex_code: []const u8) *Chameleon {
    const rgb_val = Utils.rgbFromHex(hex_code);
    return self.rgb(rgb_val[0], rgb_val[1], rgb_val[2]);
}

/// Set the background color to the hex color code.
///
/// NOTE:
/// - The `#` prefix is optional.
/// - Hex triplets are allowed. (e.g. `#FFAA00` is equivalent to `#FA0`)
///
pub inline fn bgHex(self: *Chameleon, comptime hex_code: []const u8) *Chameleon {
    const rgb_val = Utils.rgbFromHex(hex_code);
    return self.bgRgb(rgb_val[0], rgb_val[1], rgb_val[2]);
}

/// Create a new instance with the current styles as a preset.
pub inline fn createPreset(self: *Chameleon) Chameleon {
    defer self.removeAll();
    return .{
        .open = self.open,
        .close = self.close,
        .preset = true,
    };
}

test createPreset {
    comptime var cham = Chameleon{};
    comptime var preset = cham.bold().green().createPreset();
    const actual = preset.fmt("foo");
    const expected = "\u{001B}[1m\u{001B}[32mfoo\u{001B}[39m\u{001B}[22m";
    try std.testing.expectEqualStrings(expected, actual);
}
