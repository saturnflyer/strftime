require 'spec_helper'

describe Strftime::Directive do
  context '.initialize' do
    it 'should require a key' do
      lambda{ Strftime::Directive.new }.should raise_error
    end
    it 'should set the first argument to the key' do
      d = Strftime::Directive.new('%A')
      d.key.should == '%A'
    end
    it 'should set the description from the given :description' do
      d = Strftime::Directive.new('%B', :description => 'B directive')
      d.description.should == 'B directive'
    end
    it 'should set the example from the given :example' do
      d = Strftime::Directive.new('%C', :example => 'some format display')
      d.example.should == 'some format display'
    end
  end
  context '.all=' do
    it 'should set the collection of Strftime::Directive objects' do
      Strftime::Directive.all.size.should be > 0
      Strftime::Directive.all = []
      Strftime::Directive.all.size.should == 0
    end
  end
  context '.all' do
    it 'should return a collection of all Strftime::Directive objects' do
      directives = []
      Strftime::Directive.all = []
      directives << Strftime::Directive.new('%ZZ')
      Strftime::Directive.all.should =~ directives
    end
  end
  context '.default_collection' do
    it 'should return the standard collection of Strftime::Directive objects' do
      defaults = Strftime::Directive.default_collection
    end
    it 'should not be settable' do
      lambda{ Strftime::Directive.default_collection = [] }.should raise_error(NoMethodError)
    end
  end
  context '.[]' do
    it 'should return a Directive with the key of the given argument' do
      q = Strftime::Directive.new('%q')
      Strftime::Directive['%q'].should == q
    end
  end
  context '#<=>' do
    it 'should compare the key to the given directive key' do
      a = Strftime::Directive.new('%a')
      b = Strftime::Directive.new('%b')
      (a <=> b).should == -1
    end
  end
end
