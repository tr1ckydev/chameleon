const std = @import("std");
const Chameleon = @import("chameleon");

pub fn main() !void {
    comptime var c = Chameleon.initComptime();
    comptime var header = c.underline().bold().italic().blink().createPreset();
    std.debug.print("\n\t\t  {s}{s}{s}{s}{s}{s}{s}{s}{s}\n\n", .{
        header.green().fmt("C"),
        header.red().fmt("H"),
        header.blue().fmt("A"),
        header.magenta().fmt("M"),
        header.yellow().fmt("E"),
        header.green().fmt("L"),
        header.yellow().fmt("E"),
        header.cyan().fmt("O"),
        header.magenta().fmt("N"),
    });
    std.debug.print("{s} {s} {s} {s} {s} {s}\n{s} {s} {s} {s} {s} {s} {s} {s}\n{s} {s} {s} {s} {s} {s}\n", .{
        c.bold().fmt("bold"),
        c.dim().fmt("dim"),
        c.italic().fmt("italic"),
        c.underline().fmt("underline"),
        c.inverse().fmt("inverse"),
        c.strikethrough().fmt("strikethrough"),
        c.red().fmt("red"),
        c.green().fmt("green"),
        c.yellow().fmt("yellow"),
        c.blue().fmt("blue"),
        c.magenta().fmt("magenta"),
        c.cyan().fmt("cyan"),
        c.white().fmt("white"),
        c.gray().fmt("gray"),
        c.bgRed().fmt("bgRed"),
        c.bgGreen().fmt("bgGreen"),
        c.bgYellow().fmt("bgYellow"),
        c.bgBlue().fmt("bgBlue"),
        c.bgMagenta().fmt("bgMagenta"),
        c.bgCyan().fmt("bgCyan"),
    });
}
