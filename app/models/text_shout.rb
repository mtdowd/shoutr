class TextShout < ActiveRecord::Base

  validates :body, presence: true

  def self.text_shout_search(query)
    TextShout.where("body ILIKE ?", "%#{query}%")
  end

end
