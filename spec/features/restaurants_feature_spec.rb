require 'rails_helper'

feature 'restaurants' do

  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit restaurants_path
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    scenario 'display restaurants' do
      sign_up
      create_restaurant
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'sign in user creates restaurants' do
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      sign_up
      create_restaurant
      expect(page).to have_content 'KFC'
      expect(current_path).to eq restaurants_path
    end


    scenario 'does not let you submit a name that is too short' do
      sign_up
      create_ivalid_restaurant
      expect(page).not_to have_css 'h2', text: 'kf'
      expect(page).to have_content 'error'
    end
  end

  context 'viewing restaurants' do
    let!(:kfc){Restaurant.create(name:'KFC')}
    scenario 'lets a user view a restaurant' do
      sign_up
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end

  context 'editing restaurants' do
    scenario 'let owner user edit a restaurant' do
      sign_up
      create_restaurant
      edit_restaurant
      expect(page).to have_content 'Kentucky Fried Chicken'
      expect(page).to have_content 'Deep fried goodness'
      expect(current_path).to eq restaurants_path
    end

    scenario 'do not let not owner user edit a restaurant' do
      sign_up
      create_restaurant
      sign_out
      sign_up_diff_user
      edit_restaurant
      expect(page).to have_content 'You must be the owner to update a restaurant'
    end
  end

  context 'deleting restaurants' do
    scenario 'removes a restaurant when a user clicks a delete link' do
      sign_up
      create_restaurant
      click_link 'Delete KFC'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
    end

    scenario 'do not let not owner user edit a restaurant' do
      sign_up
      create_restaurant
      sign_out
      sign_up_diff_user
      click_link 'Delete KFC'
      expect(page).to have_content 'You must be the owner to delete a restaurant'
    end
  end

  scenario 'does not allow sing_out users to add a restaurant and prompts user to sign_up' do
    visit restaurants_path
    click_link 'Add a restaurant'
    expect(current_path).to eq user_session_path
  end
end
