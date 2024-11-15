const std = @import("std");
pub const ComptimeChameleon = @import("api/Comptime.zig");
pub const RuntimeChameleon = @import("api/Runtime.zig");
pub const HexColors = @import("colors.zig");

pub fn initComptime() ComptimeChameleon {
    return .{};
}

const Config = struct {
    allocator: std.mem.Allocator,
    detect_no_color: bool = true,
};

pub fn initRuntime(config: Config) RuntimeChameleon {
    return .{
        .open = std.ArrayList(u8).init(config.allocator),
        .close = std.ArrayList(u8).init(config.allocator),
        .allocator = config.allocator,
        .no_color = if (!config.detect_no_color) false else std.process.hasEnvVarConstant("NO_COLOR"),
    };
}

test {
    std.testing.refAllDecls(@This());
}
