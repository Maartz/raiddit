class Community < ApplicationRecord
  belongs_to :user
  has_many :submissions

  before_save :format_name

  def format_name
    self.name = self.name.titleize.gsub!(' ', '')
  end
end
