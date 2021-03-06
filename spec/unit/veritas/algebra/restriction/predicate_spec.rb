require File.expand_path('../../../../../spec_helper', __FILE__)

describe 'Veritas::Algebra::Restriction#predicate' do
  before do
    @relation  = Relation.new([ [ :id, Integer ] ], [ [ 1 ] ])
    @predicate = @relation[:id].eq(1)

    @restriction = Algebra::Restriction.new(@relation, @predicate)
  end

  subject { @restriction.predicate }

  it { should be_kind_of(Algebra::Restriction::Predicate) }

  it { should equal(@predicate) }
end
