def sign_up
  visit root_path
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_up_diff_user
  visit root_path
  click_link('Sign up')
  fill_in('Email', with: 't@example.com')
  fill_in('Password', with: 'testtest2')
  fill_in('Password confirmation', with: 'testtest2')
  click_button('Sign up')
end

def sign_out
  visit root_path
  click_link('Sign out')
end

def create_restaurant
  restaurants_path
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'KFC'
  click_button 'Create Restaurant'
end

def create_ivalid_restaurant
  restaurants_path
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'kf'
  click_button 'Create Restaurant'
end

def edit_restaurant
  restaurants_path
  click_link 'Edit KFC'
  fill_in 'Name', with: 'Kentucky Fried Chicken'
  fill_in 'Description', with: 'Deep fried goodness'
  click_button 'Update Restaurant'
end

def review_restaurant
  click_link 'Review KFC'
  fill_in "Thoughts", with: "so so"
  select '3', from: 'Rating'
  click_button 'Leave Review'
end

def edit_review
  click_link 'Edit Review KFC'
  fill_in "Thoughts", with: "so so so"
  select '5', from: 'Rating'
  click_button 'Leave Review'
end
