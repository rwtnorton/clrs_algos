pub fn merge_sort<T: PartialOrd + Clone>(values: &mut [T]) {
    _merge_sort(values, 0, values.len())
}

fn _merge_sort<T: PartialOrd + Clone>(values: &mut [T], lo: usize, hi: usize) {
    let n = hi - lo;
    if n <= 1 {
        return;
    }
    let mid = (n / 2) + lo;
    _merge_sort(values, lo, mid);
    _merge_sort(values, mid, hi);
    merge(values, lo, mid, hi);
}

fn merge<T: PartialOrd + Clone>(values: &mut [T], lo: usize, mid: usize, hi: usize) {
    let mut left = Vec::with_capacity(mid-lo);
    for v in values[lo..mid].iter().rev() {
        left.push(v.clone());
    }
    let mut right = Vec::with_capacity(hi-mid);
    for v in values[mid..hi].iter().rev() {
        right.push(v.clone());
    }
    let mut i = lo;
    while !left.is_empty() && !right.is_empty() {
        if left[left.len()-1] < right[right.len()-1] {
            values[i] = left.pop().unwrap();
        } else {
            values[i] = right.pop().unwrap();
        }
        i += 1;
    }
    while !left.is_empty() {
        values[i] = left.pop().unwrap();
        i += 1;
    }
    while !right.is_empty() {
        values[i] = right.pop().unwrap();
        i += 1;
    }
}

#[test]
fn test_empty_slice() {
    let mut given : Vec<i32> = vec![];
    let expect : Vec<i32> = vec![];
    merge_sort(&mut given);
    assert_eq!(given, expect, "expected slice to be empty: given={:?}", given);
}

#[test]
fn test_unary_slice() {
    let mut given : Vec<i32> = vec![42];
    let expect : Vec<i32> = vec![42];
    merge_sort(&mut given);
    assert_eq!(given, expect, "expected unary slice not change: given={:?}", given);
}

#[test]
fn test_duo_slice() {
    let mut given : Vec<i32> = vec![69, 42];
    let expect : Vec<i32> = vec![42, 69];
    merge_sort(&mut given);
    assert_eq!(given, expect);
}

#[test]
fn test_non_uniques_slice() {
    let mut given : Vec<i32> = vec![1, 2, 1, 2, 1];
    let expect : Vec<i32> = vec![1, 1, 1, 2, 2];
    merge_sort(&mut given);
    assert_eq!(given, expect);
}
