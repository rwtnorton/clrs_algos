const std = @import("std");

extern fn merge_sort(values: [*]i64, lo: usize, hi: usize, l_scratch: [*]i64, r_scratch: [*]i64) void;

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

    const scratch_n = @divFloor(arr.len, 2) + 1;
    var l_scratch = [_]i64{0} ** scratch_n;
    var l_ptr: [*]i64 = &l_scratch;
    var r_scratch = [_]i64{0} ** scratch_n;
    var r_ptr: [*]i64 = &r_scratch;

    try w.print("before: {any}\n", .{arr});
    merge_sort(ptr, 0, arr.len, l_ptr, r_ptr);
    try w.print(" after: {any}\n", .{arr});

    try bw.flush();
}
