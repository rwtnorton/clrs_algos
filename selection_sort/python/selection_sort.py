#!/usr/bin/env python3
import sys


def selection_sort(nums):
    if len(nums) == 0:
        return
    for i in range(len(nums)):
        v = nums[i]
        min_j = i
        for j in range(i, len(nums)):
            if nums[j] < nums[min_j]:
                min_j = j
        nums[i], nums[min_j] = nums[min_j], nums[i]


def main():
    nums = [int(s) for s in sys.argv[1:]]
    print(nums)
    selection_sort(nums)
    print(nums)


if __name__ == '__main__':
    main()
