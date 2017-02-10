class Answer < ActiveRecord::Base
  belongs_to :question

  validates :title, :body, presence: true
end
