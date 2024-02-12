#!/usr/bin/env python3
import sys


def insertion_sort(nums):
    if len(nums) == 0:
        return
    for i in range(1, len(nums)):
        n = nums[i]
        j = i - 1
        while j >= 0 and nums[j] > n:
            # print(f"{i}={n} {j}={nums[j]}: {nums}")
            nums[j+1] = nums[j]
            j -= 1
        nums[j+1] = n


def main():
    nums = [int(s) for s in sys.argv[1:]]
    print(nums)
    insertion_sort(nums)
    print(nums)


if __name__ == '__main__':
    main()
