require 'spec_helper'

feature "User sees individual meetup show page" do
  let! (:meetup) { Meetup.create(title: "Nutcracker Ballet", description: "Beautiful but sleep-inducing ballet.", date: "December 23rd, 2017")}

  scenario "user navigates to page" do
    visit "/meetups/meetup/#{meetup.id}"

    expect(page).to have_content "Nutcracker Ballet"
    expect(page).to have_content "Beautiful but sleep-inducing ballet."
    expect(page).to have_content "December 23rd, 2017"
  end
end
