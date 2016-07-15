require 'rails_helper'

feature 'reviewing' do
  before { Restaurant.create name: 'KFC' }

  scenario 'allows users to leave a review using a form' do
    sign_up
    leave_review('So so', '3')
    expect(current_path).to eq restaurants_path
    expect(page).to have_content('So so')
  end

  scenario 'do not allows users to leave more than one review' do
    sign_up
    leave_review('So so', '3')
    leave_review('Great', '5')
    expect(page).to have_content('You have already reviewed this restaurant')
  end

  # scenario 'displays an average rating for all reviews' do
  #   sign_up
  #   leave_review('So so', '3')
  #   sign_out
  #   sign_up_diff_user
  #   leave_review('Great', '5')
  #   expect(page).to have_content('Average rating: ★★★★☆')
  # end
end
