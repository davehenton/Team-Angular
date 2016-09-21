class Question < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :responses, as: :respondable
  belongs_to :author, class_name: 'User'
  has_one :best_answer, class_name: 'Answer'

  validates :title, :content, presence: :true
end
