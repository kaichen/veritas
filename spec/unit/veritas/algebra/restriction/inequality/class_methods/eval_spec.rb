require File.expand_path('../../../../../../../spec_helper', __FILE__)

describe 'Veritas::Algebra::Restriction::Inequality.eval' do
  describe 'with statement that is true' do
    subject { Algebra::Restriction::Inequality.eval(true, false) }

    it { should be_true }
  end

  describe 'with statement that is false' do
    subject { Algebra::Restriction::Inequality.eval(true, true) }

    it { should be_false }
  end
end
