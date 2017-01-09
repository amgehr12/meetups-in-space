class Meetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :title, null: false
      t.string :description, null: false
    end
  end
end
