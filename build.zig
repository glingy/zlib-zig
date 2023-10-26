const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const single_threaded = b.option(bool, "single_threaded", "Build single threaded") orelse false;

    const lib = b.addStaticLibrary(.{
        .name = "z",
        .target = target,
        .optimize = optimize,
        .single_threaded = single_threaded,
    });
    lib.linkLibC();
    lib.addCSourceFiles(srcs, &.{"-std=c89"});

    lib.installHeader("crc32.h", "crc32.h");
    lib.installHeader("deflate.h", "deflate.h");
    lib.installHeader("gzguts.h", "gzguts.h");
    lib.installHeader("inffast.h", "inffast.h");
    lib.installHeader("inffixed.h", "inffixed.h");
    lib.installHeader("inflate.h", "inflate.h");
    lib.installHeader("inftrees.h", "inftrees.h");
    lib.installHeader("trees.h", "trees.h");
    lib.installHeader("zconf.h", "zconf.h");
    lib.installHeader("zlib.h", "zlib.h");
    lib.installHeader("zutil.h", "zutil.h");

    b.installArtifact(lib);
}

const srcs = &.{
    "adler32.c",
    "compress.c",
    "crc32.c",
    "deflate.c",
    "gzclose.c",
    "gzlib.c",
    "gzread.c",
    "gzwrite.c",
    "inflate.c",
    "infback.c",
    "inftrees.c",
    "inffast.c",
    "trees.c",
    "uncompr.c",
    "zutil.c",
};
