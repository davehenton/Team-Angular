class Answer < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :responses, as: :respondable
  belongs_to :answerer, class_name: 'User'
  belongs_to :question

  validates :content, presence: true
end
