module TamsHelper

def register(handle, email)
  visit '/'
  click_button 'Register'
  expect(page.status_code).to eq 200
  expect(page).to have_current_path '/users/new', only_path: true
  fill_in :name, with: 'Someone'
  fill_in :handle, with: handle
  fill_in :email, with: email
  fill_in :password, with: '1234'
  fill_in :password_confirmation, with: '1234'
  click_button 'Sign up!'
  expect(page.status_code).to eq 200
  expect(page).to have_current_path '/users', only_path: true
end

def log_in(email, password)
  visit '/'
  click_button 'Log in'
  expect(page.status_code).to eq 200
  expect(page).to have_current_path '/users/log-in', only_path: true
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log in'
  expect(page.status_code).to eq 200
end

end