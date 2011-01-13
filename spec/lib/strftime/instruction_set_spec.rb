require 'spec_helper'

describe Strftime::InstructionSet do
  context '.initialize' do
    Strftime::Directive.all = Strftime::Directive.default_collection
    it 'should require an example string' do
      lambda{ Strftime::InstructionSet.new }.should raise_error
    end
    it 'should have a collection of instructions' do
      Array.should === Strftime::InstructionSet.new('test').instructions
    end
  end
  
  context '#to_s' do
    it 'should output all instructions joined by a new line' do
      test_set = Strftime::InstructionSet.new('January 01')
      test_set.to_s.should == test_set.instructions.join('
')
    end
  end
end