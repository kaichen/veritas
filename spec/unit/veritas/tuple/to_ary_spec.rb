require File.expand_path('../../../../spec_helper', __FILE__)

describe 'Veritas::Tuple#to_ary' do
  before do
    @header = Relation::Header.new([ [ :id, Integer ] ])
    @tuple  = Tuple.new(@header, [ 1 ])
  end

  subject { @tuple.to_ary }

  it { should be_instance_of(Array) }

  it { should == [ 1 ] }
end
