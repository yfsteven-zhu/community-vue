class User < ApplicationRecord

  #has_many :posts, dependent: :destroy
  #has_many :comments, dependent: :destroy
  #has_many :updates, as: :updateable, dependent: :destroy


  #has_many :active_relationships, class_name: "Relationship",
  #         foreign_key: "follower_id",
  #         dependent: :destroy

  #has_many :passive_relationships, class_name: "Relationship",
  #         foreign_key: "followed_id",
  #         dependent: :destroy

  #has_many :following, through: :active_relationships, source: :followed
  #has_many :followers, through: :passive_relationships, source: :follower

  attr_accessor :remember_token, :reset_token

  validates :name, presence: true, length: { minimum:3, maximum:15 },
            format: { with:/\A([\w\.\-\@]+\s*)+\z/,
                      message: "only allows letter, number, _, - ,@ and space" },
            uniqueness: { case_sensitive: false }

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: {minimum: 6,
                                                message:"minimum length of password is 6"},
            format: {with:/\A[\S\d]+\z/, message: "no space allowed"}, allow_nil: true


  #mount_uploader :picture, PictureUploader


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #def password_reset_expired?
  #  reset_sent_at < 2.hours.ago
  #end

  # Remember a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # returns true if the given token matches
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  #def send_password_reset_email
  #  UserMailer.password_reset(self).deliver_now
  #end

  def follow(other_user)
    following << other_user
    #Notification.create(notify_type: 'follow', actor: self, user: other_user)
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

end
