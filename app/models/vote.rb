class Vote < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :voteable, polymorphic: true

  validates :user_id, uniqueness: { scope: [:voteable_type, :voteable_id],
    message: "cannot vote more than once"
  }
end