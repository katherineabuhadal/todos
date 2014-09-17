require 'spec_helper'

feature 'Manage todos' do
  scenario 'create a new todo' do
    sign_in
    create_todo_with_description('Buy some milk')
  end

  scenario 'view only my todo' do
    create(:todo, description: 'Buy some eggs', owner_email: 'not_me@example.com')
    sign_in_as 'me@example.com'

    create_todo_with_description('Buy some milk')

    user_sees_todo_item('Buy some milk')
    user_does_not_see_todo_item('Buy some eggs')
  end

  def create_todo_with_description(description)
    click_link 'Add a new todo'
    fill_in 'Description', with: description
    click_button 'Create todo'
  end

  def user_does_not_see_todo_item(description)
    expect(page).not_to have_css 'li.todo', text: description
  end

  def user_sees_todo_item(description)
    expect(page).to have_css 'li.todo', text: description
  end
end
