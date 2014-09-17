class Todo < ActiveRecord::Base
  def user=(new_user)
    self.owner_email = new_user.email
  end
end
