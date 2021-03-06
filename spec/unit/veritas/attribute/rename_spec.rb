require File.expand_path('../../../../spec_helper', __FILE__)

describe 'Veritas::Attribute#rename' do
  before do
    @attribute = Attribute::Integer.new(:id)
    @name      = :other_id
  end

  subject { @attribute.rename(@name) }

  it { should be_kind_of(Attribute) }

  it { should_not equal(@attribute) }

  it { subject.name.should == @name }
end
