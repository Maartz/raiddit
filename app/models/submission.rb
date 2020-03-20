class Submission < ApplicationRecord
  mount_uploader :submission_image, SubmissionImageUploader
  mount_uploader :submission_video, SubmissionVideoUploader
  belongs_to :user
  belongs_to :community

  # Destroy the comments if the submission is deleted
  # Links the comment and the submission
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, length: { maximum: 8000 }
  validates :url, url: { allow_blank: true }
end
