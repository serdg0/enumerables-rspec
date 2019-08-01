require './lib/enumerables'

RSpec.describe Enumerable do

    describe "#my_all?" do

        it "returns true if all elements in the array are pairs" do
            pairs = [2, 4, 6, 8, 10]
            expect(pairs.my_all? { |x| x%2 == 0 }).to eql(true)
        end

        it "returns false is all elements in the array aren't pairs" do
            odds = [1, 3, 5, 7]
            expect(odds.my_all? { |x| x%2 == 0}).not_to eql(true)
        end
        
        it "returns true for an empty array" do
            expect([].my_all?).to eql(true)
        end
    end

    describe "#my_any?" do

        it "returns true if an element from an array is pair" do
            some = [1,2,5,7,9]
            expect(some.my_any? { |x| x%2 == 0 }).to eql(true)
        end

        it "returns false if none of the elements in an array are pair" do
            odds = [3,1,5,7]
            expect(odds.my_any? { |x| x%2 == 0 }).not_to eql(true)
        end

        it "returns false if array is empty" do
            expect([].my_any?).to eql(false)
        end
    end

    describe "#my_count" do

        it "returns the number of elements in an array" do
            expect([1,2,3,4,5].my_count).to eql(5)
        end

        it "returns the number of pair elements in an array" do
            expect([1,2,3,4].my_count { |x| x%2 == 0 }).to eql(2)
        end

        it "returns the number of words which length is equal to 3" do
            expect(["do", "ten", "win", "great"].my_count { |word| word.length == 3}).to eql(2)
        end
    end

    describe "#my_none?" do

        it "returns true if none of the elements in an array are pair" do
            expect([1,3,5].my_none? { |x| x%2 == 0 }).to eql(true)
        end

        it "returns false if an element from an array is pair" do
            expect([1,2,3,5].my_none? { |x| x%2 == 0 }).to eql(false)
        end

        it "returns true if an array is empty" do
            expect([].my_none?).to eql(true)
        end
    end

    describe "#my_select" do

        it "returns an array with all the even elements" do
            expect([1,2,4,5,7,9].my_select { |x| x%2 == 0 }).to eql([2,4])
        end

        it "returns an array with all the strings" do
            expect(["a",1,"b",2,"c",3].my_select { |x| x.is_a? String }).to eql(["a", "b", "c"])
        end

        it "returns an array with all the integers" do
            expect(["a",1,"b",2,"c",3].my_select { |x| x.is_a? Integer }).to eql([1, 2, 3])
        end
    end

    describe "#my_map" do

        it "returns true for all even numbers and false otherwise" do
            expect([2,1].my_map { |x| x%2 == 0 }).to eql([true, false])
        end

        it "returns true for every element that is a string" do
            expect(["a",2,"c"].my_map { |x| x.is_a? String }).to eql([true, false, true])
        end

        it "returns true for each element that is not an integer" do
            expect([true, 1, "a"].my_map { |x| x.is_a? Integer }).to eql([false, true, false])
        end
    end

end