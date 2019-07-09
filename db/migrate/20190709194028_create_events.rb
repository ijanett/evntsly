class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :date
      t.string :start_time
      t.string :end_time
      t.string :description
    end
  end
end
