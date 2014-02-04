require 'spec_helper'

describe Location do
  context 'valid location' do
    let(:location) { Location.create }
    subject { location }
    it { should has_many(:projects) }
  end
end
