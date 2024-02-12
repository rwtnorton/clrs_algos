mod insertion_sort;

fn main() {
    println!("Hello, world!");
    let mut nums = vec![2, 1, 0, 5, 4, 3];
    println!("{:?}", nums);
    insertion_sort::insertion_sort(&mut nums);
    println!("{:?}", nums);
}
