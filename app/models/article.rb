class Article < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 5, maximum: 500 }
    belongs_to :user
    has_many :article_topics
    has_many :topics, through: :article_topics
    has_many :comments, dependent: :destroy
end