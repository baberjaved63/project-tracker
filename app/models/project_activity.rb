class ProjectActivity < ApplicationRecord
  belongs_to :project
  belongs_to :user

  # enum old_status: Project.statuses, _prefix: :old
  # enum new_status: Project.statuses, _prefix: :new

  scope :ordered, -> { order(created_at: :desc) }

  store_accessor :additional_data, :old_status, :new_status, :content
end
