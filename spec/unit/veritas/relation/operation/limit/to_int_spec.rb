require File.expand_path('../../../../../../spec_helper', __FILE__)

describe 'Veritas::Relation::Operation::Limit#to_int' do
  before do
    @relation = Relation.new([ [ :id, Integer ] ], [ [ 1 ], [ 2 ] ])
    @ordered  = @relation.order { |r| r[:id] }

    @limit = Relation::Operation::Limit.new(@ordered, 1)
  end

  subject { @limit.to_int }

  it { should == 1 }
end
