require 'spec_helper'

describe Strftime::InstructionSet do
  context '.initialize' do
    Strftime::Directive.all = Strftime::Directive.default_collection
    it 'should require an example string' do
      expect{ Strftime::InstructionSet.new }.to raise_error(ArgumentError)
    end
    it 'should have a collection of instructions' do
      expect(Strftime::InstructionSet.new('test').instructions).to be_an(Array)
    end
  end

  context '#to_s' do
    it 'should output all instructions joined by a new line' do
      test_set = Strftime::InstructionSet.new('January 01')
      expect(test_set.to_s).to eql(test_set.instructions.join('
'))
    end
  end
end
