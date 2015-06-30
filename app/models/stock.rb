class Stock < ActiveRecord::Base
	mount_uploader :stck_img, StckImgUploader
	belongs_to :user, :category, :store
end
