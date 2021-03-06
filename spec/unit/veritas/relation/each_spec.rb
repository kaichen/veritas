require File.expand_path('../../../../spec_helper', __FILE__)

describe 'Veritas::Relation' do
  subject { Relation.new([ [ :id, Integer ] ], [ [ 1 ] ]) }

  it { should be_kind_of(Enumerable) }

  it 'should case match Enumerable' do
    (Enumerable === subject).should be_true
  end
end

describe 'Veritas::Relation#each' do
  before do
    @relation = Relation.new([ [ :id, Integer ] ], [ [ 1 ] ])

    @yield = []
  end

  subject { @relation.each { |tuple| @yield << tuple } }

  it { should equal(@relation) }

  it 'should yield each tuple' do
    method(:subject).should change { @yield.dup }.from([]).to([ [ 1 ] ])
  end
end
