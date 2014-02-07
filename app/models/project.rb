# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  creator    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base
  belongs_to :location

  def self.query_api(coordinates)
    # Return an array of Projects hopefully in the end
    query = "http://www.urbarama.com/api/project?sort=popular&offset=0&count=20&minx=#{coordinates[:min_x]}&miny=#{coordinates[:min_y]}&maxx=#{coordinates[:max_x]}&maxy=#{coordinates[:max_y]}&size=small&format=json"
    response = HTTParty.get(query)
    parsedResponse = JSON.parse(response.body.gsub("\\'", "'").gsub("\t", " "))["projects"]
  end
end
