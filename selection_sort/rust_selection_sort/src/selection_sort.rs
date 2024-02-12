pub fn selection_sort<T: PartialOrd + Clone>(values: &mut [T]) {
    if values.is_empty() {
        return
    }
    for i in 0..values.len()-1 {
        let mut min_j = i;
        for j in i..values.len() {
            if values[j] < values[min_j] {
                min_j = j;
            }
        }
        let t = values[i].clone();
        values[i] = values[min_j].clone();
        values[min_j] = t;
    }
}

#[test]
fn test_empty_slice() {
    let mut given : Vec<i32> = vec![];
    let expect : Vec<i32> = vec![];
    selection_sort(&mut given);
    assert_eq!(given, expect, "expected slice to be empty: given={:?}", given);
}

#[test]
fn test_unary_slice() {
    let mut given : Vec<i32> = vec![42];
    let expect : Vec<i32> = vec![42];
    selection_sort(&mut given);
    assert_eq!(given, expect, "expected unary slice not change: given={:?}", given);
}

#[test]
fn test_duo_slice() {
    let mut given : Vec<i32> = vec![69, 42];
    let expect : Vec<i32> = vec![42, 69];
    selection_sort(&mut given);
    assert_eq!(given, expect);
}

#[test]
fn test_non_uniques_slice() {
    let mut given : Vec<i32> = vec![1, 2, 1, 2, 1];
    let expect : Vec<i32> = vec![1, 1, 1, 2, 2];
    selection_sort(&mut given);
    assert_eq!(given, expect);
}
