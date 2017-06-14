require 'spec_helper'

describe Strftime::Directive do
  before do
    $original = Strftime::Directive.all
  end

  after do
    Strftime::Directive.all = $original
  end

  def new_directive(key, description: key, example: key, matcher: nil)
    Strftime::Directive.new(key,
      description: description,
      example: example,
      matcher: matcher || Regexp.new(key)
    )
  end

  describe '.matching' do
    it 'should return all Directives that match the given string' do
      Strftime::Directive.all = Strftime::Directive.default_collection
      expect(Strftime::Directive.matching('+1234').length).must_be :>=, 1
    end
  end
  describe '.initialize' do
    it 'should require a key' do
      expect{ new_directive }.must_raise(ArgumentError)
    end
    it 'should set the first argument to the key' do
      d = new_directive('%A')
      expect(d.key).must_equal('%A')
    end
    it 'should set the description from the given :description' do
      d = new_directive('%B', description: 'B directive')
      expect(d.description).must_equal('B directive')
    end
    it 'should set the example from the given :example' do
      d = new_directive('%C', example: 'some format display')
      expect(d.example).must_equal('some format display')
    end
    it "should set the matcher to a regular expression which matches it's replaceable text" do
      d = new_directive('%D', matcher: /ZOMG/)
      expect(d.matcher).must_equal(/ZOMG/)
    end
  end
  describe '.all=' do
    it 'should set the collection of Strftime::Directive objects' do
      expect(Strftime::Directive.all.size).must_be :>, 0
      Strftime::Directive.all = []
      expect(Strftime::Directive.all.size).must_equal(0)
    end
  end
  describe '.all' do
    it 'should return a collection of all Strftime::Directive objects' do
      directives = []
      Strftime::Directive.all = []
      directives << new_directive('%ZZ')
      expect(Strftime::Directive.all).must_equal(directives)
    end
  end
  describe '.default_collection' do
    it 'should return the standard collection of Strftime::Directive objects' do
      expect(Strftime::Directive.default_collection).must_equal(Strftime::Directive.all)
    end
    it 'should not be settable' do
      expect{ Strftime::Directive.default_collection = [] }.must_raise(NoMethodError)
    end
  end
  describe '.[]' do
    it 'should return a Directive with the key of the given argument' do
      q = new_directive('%q')
      expect(Strftime::Directive['%q']).must_equal(q)
    end
  end
  describe '#<=>' do
    it 'should compare the key to the given directive key' do
      a = new_directive('%a')
      b = new_directive('%b')
      expect((a <=> b)).must_equal(-1)
    end
  end
  describe '#to_s' do
    it 'should output formatted contents' do
      c = new_directive('%c', description: 'Test sample.', example: 'output something!')
      expect(c.to_s).must_equal('    %c  #=> output something!
        Test sample.')
    end
  end
end
