require 'spec_helper'

describe Strftime::Directive do
  context '.matching' do
    it 'should return all Directives that match the given string' do
      Strftime::Directive.all = Strftime::Directive.default_collection
      expect(Strftime::Directive.matching('+1234').length).to eql(1)
    end
  end
  context '.initialize' do
    it 'should require a key' do
      expect{ Strftime::Directive.new }.to raise_error(ArgumentError)
    end
    it 'should set the first argument to the key' do
      d = Strftime::Directive.new('%A')
      expect(d.key).to eql('%A')
    end
    it 'should set the description from the given :description' do
      d = Strftime::Directive.new('%B', :description => 'B directive')
      expect(d.description).to eql('B directive')
    end
    it 'should set the example from the given :example' do
      d = Strftime::Directive.new('%C', :example => 'some format display')
      expect(d.example).to eql('some format display')
    end
    it "should set the matcher to a regular expression which matches it's replaceable text" do
      d = Strftime::Directive.new('%D', :matcher => /ZOMG/)
      expect(d.matcher).to eql(/ZOMG/)
    end
  end
  context '.all=' do
    it 'should set the collection of Strftime::Directive objects' do
      expect(Strftime::Directive.all.size).to be > 0
      Strftime::Directive.all = []
      expect(Strftime::Directive.all.size).to eql(0)
    end
  end
  context '.all' do
    it 'should return a collection of all Strftime::Directive objects' do
      directives = []
      Strftime::Directive.all = []
      directives << Strftime::Directive.new('%ZZ')
      expect(Strftime::Directive.all).to match(directives)
    end
  end
  context '.default_collection' do
    it 'should return the standard collection of Strftime::Directive objects' do
      defaults = Strftime::Directive.default_collection
    end
    it 'should not be settable' do
      expect(lambda{ Strftime::Directive.default_collection = [] }).to raise_error(NoMethodError)
    end
  end
  context '.[]' do
    it 'should return a Directive with the key of the given argument' do
      q = Strftime::Directive.new('%q')
      expect(Strftime::Directive['%q']).to eql(q)
    end
  end
  context '#<=>' do
    it 'should compare the key to the given directive key' do
      a = Strftime::Directive.new('%a')
      b = Strftime::Directive.new('%b')
      expect((a <=> b)).to eql(-1)
    end
  end
  context '#to_s' do
    it 'should output formatted contents' do
      c = Strftime::Directive.new('%c', :description => 'Test sample.', :example => 'output something!')
      expect(c.to_s).to eql('    %c  #=> output something!
        Test sample.')
    end
  end
end
