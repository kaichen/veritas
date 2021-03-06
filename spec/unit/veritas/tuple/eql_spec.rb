require File.expand_path('../../../../spec_helper', __FILE__)

describe 'Veritas::Tuple#eql?' do
  before do
    @header = Relation::Header.new([ [ :id, Integer ] ])
    @tuple  = Tuple.new(@header, [ 1 ])
  end

  subject { @tuple.eql?(@other) }

  describe 'with the same tuple' do
    before do
      @other = @tuple
    end

    it { should be_true }

    it 'should be symmetric' do
      should == @other.eql?(@tuple)
    end
  end

  describe 'with an equivalent tuple' do
    before do
      @other = @tuple.dup
    end

    it { should be_true }

    it 'should be symmetric' do
      should == @other.eql?(@tuple)
    end
  end

  describe 'with a different tuple' do
    before do
      @other = Tuple.new(@header, [ 2 ])
    end

    it { should be_false }

    it 'should be symmetric' do
      should == @other.eql?(@tuple)
    end
  end

  describe 'with an equivalent tuple of a different class' do
    before do
      klass = Class.new(Tuple)

      @other = klass.new(@header, [ 1 ])
    end

    it { should be_false }

    it 'should be symmetric' do
      should == @other.eql?(@tuple)
    end
  end

  describe 'with an equivalent object responding to #to_ary' do
    before do
      @other = [ 1 ]
    end

    it { should be_false }

    it 'should be symmetric' do
      should == @other.eql?(@tuple)
    end
  end

  describe 'with a different object responding to #to_ary' do
    before do
      @other = [ 2 ]
    end

    it { should be_false }

    it 'should be symmetric' do
      should == @other.eql?(@tuple)
    end
  end
end
