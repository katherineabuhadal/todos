require 'spec_helper'

feature 'Manage todos' do
  scenario 'create a new todo' do
    sign_in_as 'person@example.com'
    click_link 'Add a new todo'
    fill_in 'Description', with: 'Buy some milk'
    click_button 'Create todo'

    expect(page).to have_css 'li.todo', text: 'Buy some milk'
  end
end
