class Project < ActiveRecord::Base

  MAX_PARTICIPANTS = 6

  has_many :users
  validates :users, length: { maximum: MAX_PARTICIPANTS }
  validates :name, :description, presence: true

  def can_participate?(user)
    users.length < MAX_PARTICIPANTS && user.project.nil?
  end

  def participates?(user)
    users.include? user
  end

  def is_full?
    users.size >= MAX_PARTICIPANTS
  end

end
