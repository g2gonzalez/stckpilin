class Stock < ActiveRecord::Base
	mount_uploader :stck_img, StckImgUploader
	belongs_to :user
	belongs_to :category
	belongs_to :store
end
