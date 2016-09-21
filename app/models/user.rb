class User < ActiveRecord::Base
  has_many :votes, foreign_key: :voter_id
  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :answerer_id
  has_many :responses, foreign_key: :responder_id

  validates :username, :email, :password_hash, presence: :true
end
