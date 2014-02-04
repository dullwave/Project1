require 'spec_helper'

describe Location do
  context 'valid location' do
    let(:location) { Location.create }
    subject { location }
    it { should have_many(:projects) }
  end

  describe '#full_address' do
    it 'should make a composite address by combining user input values' do
      Location.full_address('501 Longley Rd', 'Groton', 'MA', '01450').should eq("501 Longley Rd, Groton, MA, 01450")
    end
  end

  describe '.box_coordinates' do
    it 'should return a box of nearby coordinates' do
      Location.box_coordinates(40, 20).should eq({max_x: 20.3, max_y: 40.3, min_x: 19.7, min_y: 39.7})
      Location.box_coordinates(10, -5).should eq({max_x: -4.7, max_y: 10.3, min_x: -5.3, min_y: 9.7})
    end

    it 'should optionally take a distance and return a valid box' do
      Location.box_coordinates(40, 20, 0.1).should eq({max_x: 20.1, max_y: 40.1, min_x: 19.9, min_y: 39.9})
      Location.box_coordinates(10, -5, 1).should eq({max_x: -4, max_y: 11, min_x: -6, min_y: 9})
    end
  end
end
