require_relative "../find_missing_number"

RSpec.describe "#find_missing_number" do
  it "returns 5 when the first missing number is requested" do
    arr = [4, 3, 6, 2, 1, 7]
    expect(find_missing_number(arr)).to eq(5)
  end

  it "returns 8 when asking for the 2nd missing number" do
    arr = [4, 3, 6, 2, 1, 7, 9]
    expect(find_missing_number(arr, nth: 2)).to eq(8)
  end

  it "returns 10 when asking for the 3rd missing number" do
    arr = [4, 3, 6, 2, 1, 7, 9]
    expect(find_missing_number(arr, nth: 3)).to eq(10)
  end

  context "when array is empty" do
    it "returns 1 for nth=1" do
      expect(find_missing_number([])).to eq(1)
    end

    it "returns nth directly" do
      expect(find_missing_number([], nth: 99)).to eq(99)
    end
  end

  context "when array starts at a number > 1" do
    it "detects 1 as the first missing" do
      expect(find_missing_number([3, 4, 5])).to eq(1)
    end

    it "detects 2 as the second missing" do
      expect(find_missing_number([3, 4, 5], nth: 2)).to eq(2)
    end

    it "detects 6 as the third missing" do
      expect(find_missing_number([3, 4, 5], nth: 3)).to eq(6)
    end
  end

  context "when array has only one element" do
    it "returns 2 if the element is 1" do
      expect(find_missing_number([1])).to eq(2)
    end

    it "returns 1 if the element is > 1" do
      expect(find_missing_number([10])).to eq(1)
    end

    it "returns nth directly if element > 1" do
      expect(find_missing_number([10], nth: 5)).to eq(5)
    end
  end

  context "when array has no gaps up to n" do
    it "returns the next number after the max" do
      arr = [1, 2, 3, 4, 5]
      expect(find_missing_number(arr)).to eq(6)
    end

    it "returns the number of elements + nth number" do
      arr = [1, 2, 3, 4, 5]
      expect(find_missing_number(arr, nth: 10)).to eq(arr.size + 10)
    end
  end

  context "when nth is invalid" do
    it "raises error if nth < 1" do
      expect { find_missing_number([1, 2, 3], nth: 0) }.to raise_error(ArgumentError)
    end
  end

  context "when nth goes beyond the current max" do
    it "finds the correct missing number" do
      arr = (1..100).to_a
      expect(find_missing_number(arr, nth: 5)).to eq(105)
    end
  end

  context "when there is a big gap between numbers" do
    it "finds all missing numbers correctly" do
      arr = [1, 2, 50]
      expect(find_missing_number(arr)).to eq(3)
      expect(find_missing_number(arr, nth: 2)).to eq(4)
      expect(find_missing_number(arr, nth: 47)).to eq(49)
      expect(find_missing_number(arr, nth: 48)).to eq(51)
    end
  end

  context "when array is very large" do
    it "performs efficiently" do
      arr = (1..1_000_000).to_a
      expect(find_missing_number(arr)).to eq(1_000_001)
    end
  end
end
