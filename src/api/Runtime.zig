const std = @import("std");
const Styles = @import("../styles.zig");
const Utils = @import("../utils.zig");
const Chameleon = @This();

open: std.ArrayList(u8),
close: std.ArrayList(u8),
preset: bool = false,
allocator: std.mem.Allocator,
no_color: bool,

pub fn deinit(self: *Chameleon) void {
    self.open.deinit();
    self.close.deinit();
}

/// Returns the formatted text.
pub fn fmt(self: *Chameleon, comptime format: []const u8, args: anytype) ![]u8 {
    defer self.removeAll();
    const formatted = try std.fmt.allocPrint(self.allocator, format, args);
    if (self.no_color) {
        return formatted;
    } else {
        defer self.allocator.free(formatted);
        return std.mem.concat(self.allocator, u8, &.{ self.open.items, formatted, self.close.items });
    }
}

/// Print the formatted text to a `File` writer.
pub fn print(self: *Chameleon, writer: std.fs.File.Writer, comptime format: []const u8, args: anytype) !void {
    defer self.removeAll();
    try writer.writeAll(self.open.items);
    try writer.print(format, args);
    try writer.writeAll(self.close.items);
}

/// Print the formatted text to stdout.
pub fn printOut(self: *Chameleon, comptime format: []const u8, args: anytype) !void {
    return self.print(std.io.getStdOut().writer(), format, args);
}

/// Print the formatted text to stderr.
pub fn printErr(self: *Chameleon, comptime format: []const u8, args: anytype) !void {
    return self.print(std.io.getStdErr().writer(), format, args);
}

pub fn addStyle(self: *Chameleon, comptime style_name: []const u8) *Chameleon {
    if (!self.no_color) {
        const style = Utils.wrapStyle(@field(Styles, style_name));
        self.open.appendSlice(style[0]) catch {};
        self.close.appendSlice(style[1]) catch {};
    }
    return self;
}

fn removeAll(self: *Chameleon) void {
    if (self.preset) return;
    self.open.clearAndFree();
    self.close.clearAndFree();
}

pub fn reset(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bold(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn dim(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn italic(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn underline(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn blink(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn inverse(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn hidden(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn strikethrough(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn doubleUnderline(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn overline(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn black(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn red(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn green(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn yellow(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn blue(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn magenta(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn cyan(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn white(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn blackBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn gray(self: *Chameleon) *Chameleon {
    return blackBright(self);
}

pub fn grey(self: *Chameleon) *Chameleon {
    return blackBright(self);
}

pub fn redBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn greenBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn yellowBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn blueBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn magentaBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn cyanBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn whiteBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgBlack(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgRed(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgGreen(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgYellow(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgBlue(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgMagenta(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgCyan(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgWhite(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgBlackBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgGray(self: *Chameleon) *Chameleon {
    return bgBlackBright(self);
}

pub fn bgGrey(self: *Chameleon) *Chameleon {
    return bgBlackBright(self);
}

pub fn bgRedBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgGreenBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgYellowBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgBlueBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgMagentaBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgCyanBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

pub fn bgWhiteBright(self: *Chameleon) *Chameleon {
    return self.addStyle(@src().fn_name);
}

/// Set the foreground color to the rgb color values.
pub fn rgb(self: *Chameleon, comptime r: u8, comptime g: u8, comptime b: u8) *Chameleon {
    if (!self.no_color) {
        self.open.appendSlice(Utils.wrapAnsi16m(false, r, g, b)) catch {};
        self.close.appendSlice("\u{001B}[39m") catch {};
    }
    return self;
}

/// Set the background color to the rgb color values.
pub fn bgRgb(self: *Chameleon, comptime r: u8, comptime g: u8, comptime b: u8) *Chameleon {
    if (!self.no_color) {
        self.open.appendSlice(Utils.wrapAnsi16m(true, r, g, b)) catch {};
        self.close.appendSlice("\u{001B}[49m") catch {};
    }
    return self;
}

/// Set the foreground color to the hex color code.
///
/// NOTE:
/// - The `#` prefix is optional.
/// - Hex triplets are allowed. (e.g. `#FFAA00` is equivalent to `#FA0`)
///
pub fn hex(self: *Chameleon, comptime hex_code: []const u8) *Chameleon {
    if (!self.no_color) {
        const rgb_val = Utils.rgbFromHex(hex_code);
        return self.rgb(rgb_val[0], rgb_val[1], rgb_val[2]);
    }
    return self;
}

/// Set the background color to the hex color code.
///
/// NOTE:
/// - The `#` prefix is optional.
/// - Hex triplets are allowed. (e.g. `#FFAA00` is equivalent to `#FA0`)
///
pub fn bgHex(self: *Chameleon, comptime hex_code: []const u8) *Chameleon {
    if (!self.no_color) {
        const rgb_val = Utils.rgbFromHex(hex_code);
        return self.bgRgb(rgb_val[0], rgb_val[1], rgb_val[2]);
    }
    return self;
}

/// Create a new instance with the current styles as a preset.
pub inline fn createPreset(self: *Chameleon) !Chameleon {
    defer self.removeAll();
    return .{
        .open = try self.open.clone(),
        .close = try self.close.clone(),
        .preset = true,
        .allocator = self.allocator,
        .no_color = self.no_color,
    };
}

test createPreset {
    const allocator = std.testing.allocator;
    var cham = Chameleon{
        .open = std.ArrayList(u8).init(allocator),
        .close = std.ArrayList(u8).init(allocator),
        .allocator = allocator,
        .no_color = false,
    };
    defer cham.deinit();

    var bold_green = try cham.bold().green().createPreset();
    defer bold_green.deinit();

    const expected = "\u{001B}[1m\u{001B}[32mfoo bar\n\u{001B}[22m\u{001B}[39m";
    const actual = try bold_green.fmt("foo {s}\n", .{"bar"});
    defer allocator.free(actual);

    try std.testing.expectEqualSlices(u8, expected, actual);
}
