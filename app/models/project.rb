class Project < ApplicationRecord
  has_many :project_activities, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  enum status: {
    not_started: 0,
    planning: 1,
    in_progress: 2,
    completed: 3
  }, _default: :not_started
end
