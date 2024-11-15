const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const cham_mod = b.addModule("chameleon", .{
        .root_source_file = b.path("src/chameleon.zig"),
    });

    const exe = b.addExecutable(.{
        .name = "chameleon",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    exe.linkLibC();
    exe.root_module.addImport("chameleon", cham_mod);
    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const tests = b.addTest(.{ .root_source_file = b.path("src/chameleon.zig") });
    const run_tests = b.addRunArtifact(tests);
    run_tests.step.dependOn(&tests.step);
    const run_tests_step = b.step("test", "Run tests");
    run_tests_step.dependOn(&run_tests.step);
}
