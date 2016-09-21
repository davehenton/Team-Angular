class Response < ActiveRecord::Base
  has_many :votes, as: :votable
  belongs_to :respondable, polymorphic: true
  belongs_to :responder, class_name: 'User'

  validates :content, presence: true
end
