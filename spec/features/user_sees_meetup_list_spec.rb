require 'spec_helper'

feature "User sees meetup list" do
  let! (:meetup) { Meetup.create(title: "Nutcracker Ballet", description: "Beautiful but sleep-inducing ballet.", date: "December 23rd, 2017")}

  scenario "user navigates to page" do
    visit '/meetups'

    expect(page).to have_content "Nutcracker Ballet"
  end
end
