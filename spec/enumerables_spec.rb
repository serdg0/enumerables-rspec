# frozen_string_literal: true

require './lib/enumerables'

RSpec.describe Enumerable do
  let(:array) { [1, 2, 3] }
  let(:strings) { %w[a b c] }
  let(:empty) { [] }

  describe '#my_all?' do
    it 'returns true if all elements in the array are pairs' do
      pairs = [2, 4, 6, 8, 10]
      expect(pairs.my_all?(&:even?)).to eql(true)
    end

    it "returns false is all elements in the array aren't pairs" do
      odds = [1, 3, 5, 7]
      expect(odds.my_all?(&:even?)).not_to eql(true)
    end

    it 'returns true for an empty array' do
      expect([].my_all?).to eql(true)
    end
  end

  describe '#my_any?' do
    it 'returns true if an element from an array is pair' do
      some = [1, 2, 5, 7, 9]
      expect(some.my_any?(&:even?)).to eql(true)
    end

    it 'returns false if none of the elements in an array are pair' do
      odds = [3, 1, 5, 7]
      expect(odds.my_any?(&:even?)).not_to eql(true)
    end

    it 'returns false if array is empty' do
      expect([].my_any?).to eql(false)
    end
  end

  describe '#my_count' do
    it 'returns the number of elements in an array' do
      expect([1, 2, 3, 4, 5].my_count).to eql(5)
    end

    it 'returns the number of pair elements in an array' do
      expect([1, 2, 3, 4].my_count(&:even?)).to eql(2)
    end

    it 'returns the number of words which length is equal to 3' do
      expect(%w[do ten win great].my_count { |word| word.length == 3 }).to eql(2)
    end
  end

  describe '#my_none?' do
    it 'returns true if none of the elements in an array are pair' do
      expect([1, 3, 5].my_none?(&:even?)).to eql(true)
    end

    it 'returns false if an element from an array is pair' do
      expect([1, 2, 3, 5].my_none?(&:even?)).to eql(false)
    end

    it 'returns true if an array is empty' do
      expect([].my_none?).to eql(true)
    end
  end

  describe '#my_select' do
    it 'returns an array with all the even elements' do
      expect([1, 2, 4, 5, 7, 9].my_select(&:even?)).to eql([2, 4])
    end

    it 'returns an array with all the strings' do
      expect(['a', 1, 'b', 2, 'c', 3].my_select { |x| x.is_a? String }).to eql(%w[a b c])
    end

    it 'returns an array with all the integers' do
      expect(['a', 1, 'b', 2, 'c', 3].my_select { |x| x.is_a? Integer }).to eql([1, 2, 3])
    end
  end

  describe '#my_map' do
    it 'returns true for all even numbers and false otherwise' do
      expect([2, 1].my_map(&:even?)).to eql([true, false])
    end

    it 'returns true for every element that is a string' do
      expect(['a', 2, 'c'].my_map { |x| x.is_a? String }).to eql([true, false, true])
    end

    it 'returns true for each element that is not an integer' do
      expect([true, 1, 'a'].my_map { |x| x.is_a? Integer }).to eql([false, true, false])
    end
  end

  describe '#my_each' do
    it 'returns the array itself' do
      expect([1, 2, 3, 4, 5].my_each { |x| x }).to eql([1, 2, 3, 4, 5])
    end

    it 'return the array of strings itself' do
      expect(%w[a b cd e].my_each { |x| x }).to eql(%w[a b cd e])
    end

    it 'return a mixed array of integers and strings itself' do
      expect([1, 'a', 2, 'b'].my_each { |x| x }).to eql([1, 'a', 2, 'b'])
    end
  end

  describe '#my_each_index' do
    it 'returns the numbers in the array with the block passed with index' do
      expect(array.my_each_index { |x, i| array[i] = x * 2 }).to eql([2, 4, 6])
    end

    it 'returns an array of strings' do
      expect(strings.my_each_index { |x, _i| print x }).to eql(%w[a b c])
    end

    it 'return the numbers as a string' do
      expect(array.my_each_index { |x, i| array[i] = x.to_s }).to eql(%w[1 2 3])
    end
  end

  describe '#my_inject' do
    it 'returns the sum of all the elements in an array' do
      expect(array.my_inject { |x, memo| x + memo }).to eql(6)
    end

    it 'returns the total product of all elements in an array' do
      expect(array.my_inject(1) { |x, prod| x * prod }).to eql(6)
    end

    it 'returns a string composed by all the string in an array' do
      expect(strings.my_inject('') { |x, s| x + s }).to eql('abc')
    end
  end
end
