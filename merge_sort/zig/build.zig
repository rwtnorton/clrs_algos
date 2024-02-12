const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const my_lib = b.addStaticLibrary(.{
        .name = "merge_sort",
        .root_source_file = .{ .path = "merge_sort.zig" },
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "demo",
        .root_source_file = .{ .path = "demo.zig" },
        .target = target,
        .optimize = optimize,
    });

    exe.linkLibrary(my_lib);

    b.installArtifact(my_lib);
    if (b.option(bool, "enable-demo", "install the demo too") orelse false) {
        b.installArtifact(exe);
    }
}
