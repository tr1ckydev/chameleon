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

pub fn initRuntimeNoDetect(config: Config) RuntimeChameleon {
    return .{
        .allocator = config.allocator,
        .no_color = false,
    };
}

pub fn initRuntime(config: Config) std.process.Environ.CreateMapError!RuntimeChameleon {
    if (config.detect_no_color) {
        var environ_map = try std.process.Environ.createMap(.empty, config.allocator);
        defer environ_map.deinit();
        return initRuntimeFromEnviron(config, &environ_map);
    } else {
        return initRuntimeNoDetect(config);
    }
}

pub fn initRuntimeFromEnviron(config: Config, environ_map: *const std.process.Environ.Map) RuntimeChameleon {
    return .{
        .allocator = config.allocator,
        .no_color = if (!config.detect_no_color) false else environ_map.contains("NO_COLOR"),
    };
}

test {
    std.testing.refAllDecls(@This());
}
