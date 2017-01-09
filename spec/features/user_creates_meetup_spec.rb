require 'spec_helper'

feature 'User creates a new meetup' do

  scenario 'User types in text fields and clicks submit' do
    visit '/meetups/new'
    
  end
end
