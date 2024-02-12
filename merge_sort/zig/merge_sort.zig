const std = @import("std");

export fn merge_sort(values: [*]i64, lo: usize, hi: usize, l_scratch: [*]i64, r_scratch: [*]i64) void {
    const n = hi - lo;
    if (n <= 1) {
        return;
    }
    const mid = @divFloor(n, 2) + lo;
    merge_sort(values, lo, mid, l_scratch, r_scratch);
    merge_sort(values, mid, hi, l_scratch, r_scratch);
    merge(values, lo, mid, hi, l_scratch, r_scratch);
}

fn merge(vs: [*]i64, lo: usize, mid: usize, hi: usize, l_scratch: [*]i64, r_scratch: [*]i64) void {
    const l_n = mid - lo;
    const r_n = hi - mid;
    for (lo..mid) |i| {
        l_scratch[i - lo] = vs[i];
    }
    for (mid..hi) |i| {
        r_scratch[i - mid] = vs[i];
    }
    var l_i: usize = 0;
    var r_i: usize = 0;
    var vs_i: usize = lo;
    while (l_i < l_n and r_i < r_n) : (vs_i += 1) {
        if (l_scratch[l_i] < r_scratch[r_i]) {
            vs[vs_i] = l_scratch[l_i];
            l_i += 1;
        } else {
            vs[vs_i] = r_scratch[r_i];
            r_i += 1;
        }
    }
    while (l_i < l_n) : (l_i += 1) {
        vs[vs_i] = l_scratch[l_i];
        vs_i += 1;
    }
    while (r_i < r_n) : (r_i += 1) {
        vs[vs_i] = r_scratch[r_i];
        vs_i += 1;
    }
}

test "empty array" {
    var arr = [_]i64{};
    var ptr: [*]i64 = &arr;
    var l_arr = [_]i64{0} ** (@divFloor(arr.len, 2) + 1);
    var l_ptr = &l_arr;
    var r_arr = [_]i64{0} ** (@divFloor(arr.len, 2) + 1);
    var r_ptr = &r_arr;
    merge_sort(ptr, 0, arr.len, l_ptr, r_ptr);
    try std.testing.expectEqual(0, arr.len);
}

test "unary array" {
    var arr = [_]i64{42};
    var ptr: [*]i64 = &arr;
    var l_arr = [_]i64{0} ** (@divFloor(arr.len, 2) + 1);
    var l_ptr = &l_arr;
    var r_arr = [_]i64{0} ** (@divFloor(arr.len, 2) + 1);
    var r_ptr = &r_arr;
    merge_sort(ptr, 0, arr.len, l_ptr, r_ptr);
    var expect: [arr.len]i64 = undefined;
    std.mem.copyForwards(i64, &expect, &arr);
    try std.testing.expectEqual(expect, arr);
}

test "duo array" {
    var arr = [_]i64{ 69, 42 };
    var ptr: [*]i64 = &arr;
    var l_arr = [_]i64{0} ** (@divFloor(arr.len, 2) + 1);
    var l_ptr = &l_arr;
    var r_arr = [_]i64{0} ** (@divFloor(arr.len, 2) + 1);
    var r_ptr = &r_arr;
    merge_sort(ptr, 0, arr.len, l_ptr, r_ptr);
    var expect = [arr.len]i64{ 42, 69 };
    try std.testing.expectEqual(expect, arr);
}

test "non-unique items" {
    var arr = [_]i64{ 1, 2, 1, 2, 1 };
    var ptr: [*]i64 = &arr;
    var l_arr = [_]i64{0} ** (@divFloor(arr.len, 2) + 1);
    var l_ptr = &l_arr;
    var r_arr = [_]i64{0} ** (@divFloor(arr.len, 2) + 1);
    var r_ptr = &r_arr;
    merge_sort(ptr, 0, arr.len, l_ptr, r_ptr);
    var expect = [arr.len]i64{ 1, 1, 1, 2, 2 };
    try std.testing.expectEqual(expect, arr);
}
