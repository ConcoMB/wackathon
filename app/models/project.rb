class Project < ActiveRecord::Base

  MAX_PARTICIPANTS = 5

  has_many :users
  has_many :project_exceptions
  validates :users, length: { maximum: MAX_PARTICIPANTS }
  validates :name, :description, presence: true
  
  def can_participate?(user)
    users.length != MAX_PARTICIPANTS && user.project.nil?
  end

  def participates?(user)
    users.include? user
  end

  def is_full?
    users.size == MAX_PARTICIPANTS
  end

  def can_request_exception?(user) 
    !participates?(user) && is_full? && user.project.blank? && !has_requested_exception?(user)
  end

  def has_requested_exception?(user)
    project_exceptions.any? { |e| e.user == user }
  end

end
