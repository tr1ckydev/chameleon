// Modifiers
pub const reset = [_][]const u8{ "0", "0" };
pub const bold = [_][]const u8{ "1", "22" };
pub const dim = [_][]const u8{ "2", "22" };
pub const italic = [_][]const u8{ "3", "23" };
pub const underline = [_][]const u8{ "4", "24" };
pub const blink = [_][]const u8{ "5", "25" };
pub const inverse = [_][]const u8{ "7", "27" };
pub const hidden = [_][]const u8{ "8", "28" };
pub const strikethrough = [_][]const u8{ "9", "29" };
pub const doubleUnderline = [_][]const u8{ "21", "24" };
pub const overline = [_][]const u8{ "53", "55" };

// Foreground colors
pub const black = [_][]const u8{ "30", "39" };
pub const red = [_][]const u8{ "31", "39" };
pub const green = [_][]const u8{ "32", "39" };
pub const yellow = [_][]const u8{ "33", "39" };
pub const blue = [_][]const u8{ "34", "39" };
pub const magenta = [_][]const u8{ "35", "39" };
pub const cyan = [_][]const u8{ "36", "39" };
pub const white = [_][]const u8{ "37", "39" };

// Foreground bright colors
pub const blackBright = [_][]const u8{ "90", "39" };
pub const redBright = [_][]const u8{ "91", "39" };
pub const greenBright = [_][]const u8{ "92", "39" };
pub const yellowBright = [_][]const u8{ "93", "39" };
pub const blueBright = [_][]const u8{ "94", "39" };
pub const magentaBright = [_][]const u8{ "95", "39" };
pub const cyanBright = [_][]const u8{ "96", "39" };
pub const whiteBright = [_][]const u8{ "97", "39" };

// Background colors
pub const bgBlack = [_][]const u8{ "40", "49" };
pub const bgRed = [_][]const u8{ "41", "49" };
pub const bgGreen = [_][]const u8{ "42", "49" };
pub const bgYellow = [_][]const u8{ "43", "49" };
pub const bgBlue = [_][]const u8{ "44", "49" };
pub const bgMagenta = [_][]const u8{ "45", "49" };
pub const bgCyan = [_][]const u8{ "46", "49" };
pub const bgWhite = [_][]const u8{ "47", "49" };

// Background bright colors
pub const bgBlackBright = [_][]const u8{ "100", "49" };
pub const bgRedBright = [_][]const u8{ "101", "49" };
pub const bgGreenBright = [_][]const u8{ "102", "49" };
pub const bgYellowBright = [_][]const u8{ "103", "49" };
pub const bgBlueBright = [_][]const u8{ "104", "49" };
pub const bgMagentaBright = [_][]const u8{ "105", "49" };
pub const bgCyanBright = [_][]const u8{ "106", "49" };
pub const bgWhiteBright = [_][]const u8{ "107", "49" };
