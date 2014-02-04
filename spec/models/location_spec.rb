require 'spec_helper'

describe Location do
  context 'valid location' do
    let(:location) { Location.create }
    subject { location }
    it { should have_many(:projects) }
  end

  describe '.box_coordinates' do
    it 'should return a box of nearby coordinates' do
      Location.box_coordinates(40, 20).should eq({max_x: 40.3, max_y: 20.3, min_x: 39.7, min_y: 19.7})
      Location.box_coordinates(10, -5).should eq({max_x: 10.3, max_y: -4.7, min_x: 9.7, min_y: -5.3})
    end

    it 'should optionally take a distance and return a valid box' do
      Location.box_coordinates(40, 20, 0.1).should eq({max_x: 40.1, max_y: 20.1, min_x: 39.9, min_y: 19.9})
      Location.box_coordinates(10, -5, 1).should eq({max_x: 11, max_y: -4, min_x: 9, min_y: -6})
    end
  end
end
