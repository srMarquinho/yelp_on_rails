def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def create_restaurant
  visit '/restaurants'
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'KFC'
  click_button 'Create Restaurant'
end

def create_ivalid_restaurant
  visit '/restaurants'
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'kf'
  click_button 'Create Restaurant'
end

def edit_restaurant
  visit '/restaurants'
  click_link 'Edit KFC'
  fill_in 'Name', with: 'Kentucky Fried Chicken'
  fill_in 'Description', with: 'Deep fried goodness'
  click_button 'Update Restaurant'
end
