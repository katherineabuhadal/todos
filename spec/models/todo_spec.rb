require 'spec_helper'

describe Todo, '#user=' do
 it 'assigns owner_email from the user passed in email' do
   user = User.new('person@example.com')
   todo = Todo.new
   todo.user = user
   expect(todo.owner_email).to eq 'person@example.com'
 end
end
