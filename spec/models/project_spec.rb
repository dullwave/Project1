require 'spec_helper'

describe Project do
  context 'valid project' do
    let(:project) { Project.create }
    let(:coordinates) { Location.box_coordinates(40.71, -74) }
    subject { project }

    describe 'associations' do
      it { should belong_to(:location) }
    end

    describe '.query_api' do
      it 'should an array of projects' do
        Project.query_api(coordinates).should be_an(Array)
      end

      it 'should have hashes of Projects inside the array' do
        Project.query_api(coordinates).first.should be_a(Hash)
      end

      it 'should have some keys we expect on that hash' do
        Project.query_api(coordinates).first.keys.should include("project_title",
                                                    "project_url",
                                                    "project_desc",
                                                    "longitude",
                                                    "latitude",
                                                    "photo_id",
                                                    "photo_icon",
                                                    "photo_url",
                                                    "photo_width",
                                                    "photo_height",
                                                    "upload_date",
                                                    "owner_username",
                                                    "owner_name",
                                                    "owner_url")
      end
    end
  end
end
