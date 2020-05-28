class Post < ApplicationRecord

	attachment :post_image

	belongs_to :user
	has_many :post_comments, dependent: :destroy
 	has_many :favorites, dependent: :destroy

 	validates :title, presence:true ,length:{maximum: 20}
 	validates :body, presence:true ,length:{maximum: 200}
end
