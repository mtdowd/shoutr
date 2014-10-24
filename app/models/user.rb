class User < ActiveRecord::Base
  has_many :shouts

  has_many :likes
  has_many :liked_shouts, through: :likes, source: :shout

  has_many :following_relationships, foreign_key: :follower_id, class_name: "FollowRelationship"
  has_many :followed_users, through: :following_relationships

  has_many :followed_relationships, foreign_key: :followed_user_id, class_name: "FollowRelationship"
  has_many :followers, through: :followed_relationships

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true

  def to_param
    username
  end

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.destroy(user)
  end

  def show
    @user = User.find_by(username: params[:id])
    @shouts = @user.shouts
  end

  def timeline
    Shout.where(user_id: timeline_author_ids).order(created_at: :desc)
  end

  def self.user_query(query)
    where("username ILIKE ?", "%#{query}%")
  end

  private

  def timeline_author_ids
    [id] + followed_user_ids
  end
 
end
