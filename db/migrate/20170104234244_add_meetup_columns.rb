class AddMeetupColumns < ActiveRecord::Migration
  def change
    add_column :meetups, :location, :string
    add_column :meetups, :time, :string
  end
end
