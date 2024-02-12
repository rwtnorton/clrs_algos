const std = @import("std");

extern fn selection_sort(values: [*]i64, n: usize) void;

pub fn main() !void {
    const stdout = std.io.getStdOut();
    var bw = std.io.bufferedWriter(stdout.writer());
    const w = bw.writer();
    errdefer {
        bw.flush() catch |err| std.debug.print("flush failed: {any}\n", .{err});
    }

    var arr = [_]i64{
        9, 1, 5, 7, -1, 1, 2, 3, 5, 4,
    };
    var ptr: [*]i64 = &arr;

    try w.print("before: .{any}\n", .{arr});
    selection_sort(ptr, arr.len);
    try w.print(" after: .{any}\n", .{arr});

    try bw.flush();
}
