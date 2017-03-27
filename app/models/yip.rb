class Yip < ApplicationRecord
	default_scope {order(created_at: :desc)}
	validates :content, :user, presence: true
	belongs_to :user
	validates :content, length: {maximum:140}
end
