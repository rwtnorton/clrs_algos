pub fn insertion_sort<T: PartialOrd + Clone>(values: &mut [T]) {
    if values.len() == 0 {
        return
    }
    for i in 1..values.len() {
        let v = values[i].clone();
        let mut j = i - 1;
        // usize makes this a little funky.
        let mut exhausted = false;
        while values[j] > v {
            values[j+1] = values[j].clone();
            if j == 0 {
                exhausted = true;
                break;
            }
            j -= 1;
        }
        if exhausted {
            values[0] = v;
        } else {
            values[j + 1] = v;
        }
    }
}

#[test]
fn test_empty_slice() {
    let mut given : Vec<i32> = vec![];
    let expect : Vec<i32> = vec![];
    insertion_sort(&mut given);
    assert_eq!(given, expect, "expected slice to be empty: given={:?}", given);
}

#[test]
fn test_unary_slice() {
    let mut given : Vec<i32> = vec![42];
    let expect : Vec<i32> = vec![42];
    insertion_sort(&mut given);
    assert_eq!(given, expect, "expected unary slice not change: given={:?}", given);
}

#[test]
fn test_duo_slice() {
    let mut given : Vec<i32> = vec![69, 42];
    let expect : Vec<i32> = vec![42, 69];
    insertion_sort(&mut given);
    assert_eq!(given, expect);
}

#[test]
fn test_nonuniques_slice() {
    let mut given : Vec<i32> = vec![1, 2, 1, 2, 1];
    let expect : Vec<i32> = vec![1, 1, 1, 2, 2];
    insertion_sort(&mut given);
    assert_eq!(given, expect);
}
