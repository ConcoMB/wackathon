class Project < ActiveRecord::Base

  MAX_PARTICIPANTS = 5

  has_many :users
  validates :users, length: { maximum: MAX_PARTICIPANTS }
  validates :name, :description, presence: true
  
  def can_participate?(user)
    users.length != MAX_PARTICIPANTS && user.project.nil?
  end

  def can_quit?(user)
    users.include? user
  end

end
