require "set"

# Finds the nth missing positive integer from an array of positive integers.
# If nth is not provided, it defaults to 1 (the first missing positive integer).
# returns Integer
# raises ArgumentError if nth < 1
def find_missing_number(arr, nth: 1)
  raise ArgumentError, "nth must be >= 1" if nth < 1

  # Using set since it is more efficient for lookups, and no need to order it(which would increment time complexity)
  numbers_set = arr.to_set
  missing_count = 0
  iterator = 1

  loop do
    unless numbers_set.include?(iterator)
      missing_count += 1
      return iterator if missing_count == nth
    end
    iterator += 1
  end
end