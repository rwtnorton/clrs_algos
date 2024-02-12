mod merge_sort;

fn main() {
    let mut nums = vec![2, 1, 0, 5, 4, 3];
    println!("{:?}", nums);
    merge_sort::merge_sort(&mut nums);
    println!("{:?}", nums);
}
