class Project < ActiveRecord::Base

  MAX_PARTICIPANTS = 4

  has_many :users
  belongs_to :organizer, class_name: 'User'
  validates :users, length: { maximum: MAX_PARTICIPANTS }
  validates :organizer, :name, :description, presence: true
  
  def can_participate?(user)
    user != organizer && users.length != MAX_PARTICIPANTS && !users.include?(user)
  end

  def can_quit?(user)
    users.include? user
  end

end
