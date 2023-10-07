const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("chameleon", .{
        .source_file = .{ .path = "src/chameleon.zig" },
    });
}
