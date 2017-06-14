require 'spec_helper'

describe Strftime::InstructionSet do
  describe '.initialize' do
    Strftime::Directive.all = Strftime::Directive.default_collection
    it 'should require an example string' do
      expect{ Strftime::InstructionSet.new }.must_raise(ArgumentError)
    end
    it 'should have a collection of instructions' do
      expect(Strftime::InstructionSet.new('test').instructions).must_be_kind_of(Array)
    end
  end

  describe '#to_s' do
    it 'should output all instructions joined by a new line' do
      test_set = Strftime::InstructionSet.new('January 01')
      expect(test_set.to_s).must_equal(test_set.instructions.join('
'))
    end
  end
end
