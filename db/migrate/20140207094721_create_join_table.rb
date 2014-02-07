class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :locations, :projects do |t|
       t.index [:location_id, :project_id]
       t.index [:project_id, :location_id]
    end
  end
end
