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
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bold(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn dim(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn italic(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn underline(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn overline(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn inverse(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn hidden(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
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
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn black(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn red(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn green(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn yellow(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn blue(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn magenta(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn cyan(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn white(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn blackBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn gray(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn grey(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn redBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn greenBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn yellowBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn blueBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn magentaBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn cyanBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn whiteBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgBlack(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgRed(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgGreen(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgYellow(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgBlue(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgMagenta(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgCyan(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgWhite(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgBlackBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgGray(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgGrey(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgRedBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgGreenBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgYellowBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgBlueBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgMagentaBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgCyanBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
    }

    pub inline fn bgWhiteBright(self: Chameleon) Chameleon {
        return Utils.getStyle(self, @src().fn_name);
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
