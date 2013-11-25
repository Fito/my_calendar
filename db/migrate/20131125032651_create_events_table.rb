class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamp :date
      t.string :title
      t.string :description
      t.integer :user_id
    end
  end
end
