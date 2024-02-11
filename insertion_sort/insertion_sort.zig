const std = @import("std");

export fn insertion_sort(values: [*]i64, n: usize) void {
    if (n == 0) {
        return;
    }
    // var hmm = values[0..n];
    for (1..n) |i| {
        const v = values[i];
        var j = i - 1;
        var exhausted = false;
        while (j >= 0 and values[j] > v) : (j -= 1) {
            // std.debug.print("i={d}, v={d}, j={d}, vj={d}\t:{any}\n", .{ i, v, j, values[j], hmm });
            values[j + 1] = values[j];
            // std.debug.print("\t\t\t:{any}\n", .{hmm});
            if (j == 0) {
                exhausted = true;
                break;
            }
        }
        if (exhausted) {
            values[0] = v;
        } else {
            values[j + 1] = v;
        }
        // std.debug.print("** placed {d} at {d}\t:{any}\n", .{ v, j, hmm });
    }
}

test "empty array" {
    var arr = [_]i64{};
    var ptr: [*]i64 = &arr;
    insertion_sort(ptr, arr.len);
    try std.testing.expectEqual(0, arr.len);
}

test "unary array" {
    var arr = [_]i64{42};
    var ptr: [*]i64 = &arr;
    insertion_sort(ptr, arr.len);
    var expect: [arr.len]i64 = undefined;
    std.mem.copyForwards(i64, &expect, &arr);
    try std.testing.expectEqual(expect, arr);
}

test "duo array" {
    var arr = [_]i64{ 69, 42 };
    var ptr: [*]i64 = &arr;
    insertion_sort(ptr, arr.len);
    var expect = [arr.len]i64{ 42, 69 };
    try std.testing.expectEqual(expect, arr);
}

test "non-unique items" {
    var arr = [_]i64{ 1, 2, 1, 2, 1 };
    var ptr: [*]i64 = &arr;
    insertion_sort(ptr, arr.len);
    var expect = [arr.len]i64{ 1, 1, 1, 2, 2 };
    try std.testing.expectEqual(expect, arr);
}
