class Shout < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true

  def username
    user.username
  end

end
