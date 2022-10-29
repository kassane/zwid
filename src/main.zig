/// BSD 3-Clause License
///
/// Copyright (c) 2022, Matheus Catarino França
/// All rights reserved.
///
/// Redistribution and use in source and binary forms, with or without
/// modification, are permitted provided that the following conditions are met:
///
/// 1. Redistributions of source code must retain the above copyright notice, this
///    list of conditions and the following disclaimer.
///
/// 2. Redistributions in binary form must reproduce the above copyright notice,
///    this list of conditions and the following disclaimer in the documentation
///    and/or other materials provided with the distribution.
///
/// 3. Neither the name of the copyright holder nor the names of its
///    contributors may be used to endorse or promote products derived from
///    this software without specific prior written permission.
const std = @import("std");
const Allocator = std.mem.Allocator;
const log = std.log;
const filestream = std.fs;

const MAGIC: [16]u8 = &[_]u8{
    0x53, 0x42, 0x4F, 0x4D, 0xD6, 0xBA, 0x2E, 0xAC,
    0xA3, 0xE6, 0x7A, 0x52, 0xAA, 0xEE, 0x3B, 0xAF,
};

const uSWID = struct {
    Magic: [16]u8,
    Header_ver: u8,
    Header_size: u16,
    Payload_size: u16,
    Payload: []const u8,
};

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Run `zig build test` to run the tests.\n", .{});

    try bw.flush(); // don't forget to flush!
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
