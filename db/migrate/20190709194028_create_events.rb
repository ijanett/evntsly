class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :date
      t.string :time
      t.string :description
    end
  end
end
