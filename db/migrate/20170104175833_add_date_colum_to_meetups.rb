class AddDateColumToMeetups < ActiveRecord::Migration
  def change
    add_column :meetups, :date, :string
  end
end
