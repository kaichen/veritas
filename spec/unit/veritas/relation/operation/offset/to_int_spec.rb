require File.expand_path('../../../../../../spec_helper', __FILE__)

describe 'Veritas::Relation::Operation::Offset#to_int' do
  before do
    @relation = Relation.new([ [ :id, Integer ] ], [ [ 1 ], [ 2 ] ])
    @ordered  = @relation.order { |r| r[:id] }

    @remainder = Relation::Operation::Offset.new(@ordered, 1)
  end

  subject { @remainder.to_int }

  it { should == 1 }
end
