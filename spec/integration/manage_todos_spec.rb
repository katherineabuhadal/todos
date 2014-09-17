require 'spec_helper'

feature 'Manage todos' do
  scenario 'create a new todo' do
    sign_in
    click_link 'Add a new todo'
    fill_in 'Description', with: 'Buy some milk'
    click_button 'Create todo'

    expect(page).to have_css 'li.todo', text: 'Buy some milk'
  end

  scenario 'view only my todo' do
    Todo.create(description: 'Buy some eggs', owner_email: 'not_me@example.com')
    sign_in_as 'me@example.com'

    click_link 'Add a new todo'
    fill_in 'Description', with: 'Buy some milk'
    click_button 'Create todo'

    expect(page).to have_css 'li.todo', text: 'Buy some milk'
    expect(page).not_to have_css 'li.todo', text: 'Buy some eggs'
  end
end
