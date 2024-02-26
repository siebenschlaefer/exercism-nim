import unittest
import knapsack

suite "knapsack":
  test "no items":
    const maximumWeight = 100
    const items: array[0, tuple[weight: int, value: int]] = []
    const expected = 0
    check maximumValue(maximumWeight, items) == expected

  test "one item, too heavy":
    const maximumWeight = 10
    const items = [(weight: 100, value: 1)]
    const expected = 0
    check maximumValue(maximumWeight, items) == expected

  test "five items (cannot be greedy by weight)":
    const maximumWeight = 10
    const items = [
      (weight: 2, value: 5), (weight: 2, value: 5), (weight: 2, value: 5),
      (weight: 2, value: 5), (weight: 10, value: 21)
    ]
    const expected = 21
    check maximumValue(maximumWeight, items) == expected

  test "five items (cannot be greedy by value)":
    const maximumWeight = 10
    const items = [
      (weight: 2, value: 20), (weight: 2, value: 20), (weight: 2, value: 20),
      (weight: 2, value: 20), (weight: 10, value: 50)
    ]
    const expected = 80
    check maximumValue(maximumWeight, items) == expected

  test "example knapsack":
    const maximumWeight = 10
    const items = [
      (weight: 5, value: 10), (weight: 4, value: 40), (weight: 6, value: 30),
      (weight: 4, value: 50)
    ]
    const expected = 90
    check maximumValue(maximumWeight, items) == expected

  test "8 items":
    const maximumWeight = 104
    const items = [
      (weight: 25, value: 350), (weight: 35, value: 400), (weight: 45, value: 450),
      (weight: 5, value: 20), (weight: 25, value: 70), (weight: 3, value: 8),
      (weight: 2, value: 5), (weight: 2, value: 5)
    ]
    const expected = 900
    check maximumValue(maximumWeight, items) == expected

  test "15 items":
    const maximumWeight = 750
    const items = [
      (weight: 70, value: 135), (weight: 73, value: 139), (weight: 77, value: 149),
      (weight: 80, value: 150), (weight: 82, value: 156), (weight: 87, value: 163),
      (weight: 90, value: 173), (weight: 94, value: 184), (weight: 98, value: 192),
      (weight: 106, value: 201), (weight: 110, value: 210), (weight: 113, value: 214),
      (weight: 115, value: 221), (weight: 118, value: 229), (weight: 120, value: 240)
    ]
    const expected = 1458
    check maximumValue(maximumWeight, items) == expected
