class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :content, presence: true

  def username
    user.username
  end

  def self.text_shout_query(query)
    where(content_type: "TextShout", content_id: query)
  end

end
