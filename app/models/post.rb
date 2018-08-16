class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true
  validates :url, presence: true, uniqueness: true

  include Voteable

  def vote_sort
    self.comments.sort_by{|c| c.total_votes}.reverse
  end

  def self.vote_sort
    self.all.sort_by{|p| p.total_votes}.reverse
  end
end