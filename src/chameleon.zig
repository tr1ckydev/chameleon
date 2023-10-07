const Styles = @import("styles.zig").Styles;
const Utils = @import("utils.zig");

const InitColorLevel = enum { Disabled, BasicColor, Color256, TrueColor, Auto };
const ColorLevel = enum { Disabled, BasicColor, Color256, TrueColor };

pub const Chameleon = struct {
    level: ColorLevel,
    visible_always: bool = true,
    open: []const u8 = "",
    close: []const u8 = "",

    pub fn init(color_level: InitColorLevel) Chameleon {
        return .{
            .level = if (color_level == .Auto) .TrueColor else @field(ColorLevel, @tagName(color_level)),
        };
    }

    pub inline fn reset(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bold(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn dim(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn italic(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn underline(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn overline(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn inverse(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn hidden(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn visible(self: Chameleon) Chameleon {
        comptime return .{
            .level = self.level,
            .visible_always = false,
            .open = self.open,
            .close = self.close,
        };
    }

    pub inline fn strikethrough(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn black(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn red(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn green(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn yellow(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn blue(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn magenta(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn cyan(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn white(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn blackBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn gray(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn grey(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn redBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn greenBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn yellowBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn blueBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn magentaBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn cyanBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn whiteBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgBlack(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgRed(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgGreen(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgYellow(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgBlue(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgMagenta(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgCyan(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgWhite(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgBlackBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgGray(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgGrey(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgRedBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgGreenBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgYellowBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgBlueBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgMagentaBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgCyanBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn bgWhiteBright(self: Chameleon) Chameleon {
        const style = Utils.wrapStyle(@field(Styles, @src().fn_name));
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ style[0],
            .close = self.close ++ style[1],
        };
    }

    pub inline fn rgb(self: Chameleon, r: u8, g: u8, b: u8) Chameleon {
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ Utils.wrapAnsi16m(false, r, g, b),
            .close = self.close ++ "\u{001B}[39m",
        };
    }

    pub inline fn bgRgb(self: Chameleon, r: u8, g: u8, b: u8) Chameleon {
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ Utils.wrapAnsi16m(true, r, g, b),
            .close = self.close ++ "\u{001B}[49m",
        };
    }

    pub inline fn hex(self: Chameleon, comptime hexCode: []const u8) Chameleon {
        const rgbVal = Utils.rgbFromHex(hexCode);
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ Utils.wrapAnsi16m(false, rgbVal[0], rgbVal[1], rgbVal[2]),
            .close = self.close ++ "\u{001B}[39m",
        };
    }

    pub inline fn bgHex(self: Chameleon, comptime hexCode: []const u8) Chameleon {
        const rgbVal = Utils.rgbFromHex(hexCode);
        comptime return .{
            .level = self.level,
            .visible_always = self.visible_always,
            .open = self.open ++ Utils.wrapAnsi16m(true, rgbVal[0], rgbVal[1], rgbVal[2]),
            .close = self.close ++ "\u{001B}[49m",
        };
    }

    pub inline fn fmt(self: Chameleon, comptime text: []const u8) []const u8 {
        if (self.level == .Disabled) {
            return if (self.visible_always) text else "";
        } else {
            return self.open ++ text ++ self.close;
        }
    }
};
