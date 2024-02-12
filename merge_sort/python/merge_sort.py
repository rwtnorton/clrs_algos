#!/usr/bin/env python3
import sys
from collections import deque


def merge_sort(nums):
    _merge_sort(nums, 0, len(nums))


def _merge_sort(nums, lo, hi):
    n = hi - lo
    if n <= 1:
        return
    mid = (n // 2) + lo
    # print(f"_merge_sort: n={n}, lo={lo}, mid={mid}, hi={hi}")
    _merge_sort(nums, lo, mid)
    _merge_sort(nums, mid, hi)
    merge(nums, lo, mid, hi)


def merge(nums, lo, mid, hi):
    # print(f"merge: lo={lo}, mid={mid}, hi={hi}")
    left = deque(nums[lo:mid])
    right = deque(nums[mid:hi])
    n_i = lo
    while left and right:
        if left[0] < right[0]:
            nums[n_i] = left.popleft()
        else:
            nums[n_i] = right.popleft()
        n_i += 1
    while left:
        nums[n_i] = left.popleft()
        n_i += 1
    while right:
        nums[n_i] = right.popleft()
        n_i += 1


def main():
    nums = [int(s) for s in sys.argv[1:]]
    print(nums)
    merge_sort(nums)
    print(nums)


if __name__ == '__main__':
    main()
