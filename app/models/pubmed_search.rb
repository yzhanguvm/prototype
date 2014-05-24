class PubmedSearch < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :query, presence: true, length: { maximum: 150 }
  validates :user_id, presence: true
end
