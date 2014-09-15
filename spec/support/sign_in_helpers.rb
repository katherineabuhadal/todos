module SignInHelpers
  def sign_in
    sign_in_as 'person@example.com'
  end

  def sign_in_as(email)
    visit root_path
    fill_in 'Email address', with: 'person@example.com'
    click_button 'Sign In'
  end

  Rspec.configure do |config|
    config.include SignInHelpers
  end
end
