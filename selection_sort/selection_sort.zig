const std = @import("std");

export fn selection_sort(values: [*]i64, n: usize) void {
    if (n == 0) {
        return;
    }
    for (0..(n - 1)) |i| {
        var min_j = i;
        for (i..n) |j| {
            if (values[j] < values[min_j]) {
                min_j = j;
            }
        }
        std.mem.swap(i64, &values[i], &values[min_j]);
    }
}

test "empty array" {
    var arr = [_]i64{};
    var ptr: [*]i64 = &arr;
    selection_sort(ptr, arr.len);
    try std.testing.expectEqual(0, arr.len);
}

test "unary array" {
    var arr = [_]i64{42};
    var ptr: [*]i64 = &arr;
    selection_sort(ptr, arr.len);
    var expect: [arr.len]i64 = undefined;
    std.mem.copyForwards(i64, &expect, &arr);
    try std.testing.expectEqual(expect, arr);
}

test "duo array" {
    var arr = [_]i64{ 69, 42 };
    var ptr: [*]i64 = &arr;
    selection_sort(ptr, arr.len);
    var expect = [arr.len]i64{ 42, 69 };
    try std.testing.expectEqual(expect, arr);
}

test "non-unique items" {
    var arr = [_]i64{ 1, 2, 1, 2, 1 };
    var ptr: [*]i64 = &arr;
    selection_sort(ptr, arr.len);
    var expect = [arr.len]i64{ 1, 1, 1, 2, 2 };
    try std.testing.expectEqual(expect, arr);
}
