require 'rails_helper'

feature 'reviewing' do
  before { Restaurant.create name: 'KFC' }

  scenario 'allows users to leave a review using a form' do
    sign_up
    review_restaurant
    expect(current_path).to eq restaurants_path
    expect(page).to have_content('so so')
  end

  # scenario 'allows users to edit their own review' do
  #   sign_up
  #   review_restaurant
  #   edit_review
  #   expect(page).to have_content('so so so')
  # end
  #
  # scenario 'allows users to edit reviews they dont own' do
  #   sign_up
  #   review_restaurant
  #   sing_out
  #   sign_up_diff_user
  #   edit_review
  #   expect(page).to have_content('You must be the owner to update a restaurant')
  # end

  scenario 'do not allows users to leave more than one review' do
    sign_up
    review_restaurant
    review_restaurant
    expect(page).to have_content('You have already reviewed this restaurant')
  end
end
