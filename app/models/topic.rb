class Topic < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
  has_many :articles_topics
  has_many :articles, through: :articles_topics
end     