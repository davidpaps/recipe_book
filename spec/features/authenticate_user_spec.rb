feature 'authentication' do
  scenario 'a user can sign in' do
    User.create('test@test.com', 'password')
    visit'/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).to have_content 'Welcome test@example.com!'
  end
end