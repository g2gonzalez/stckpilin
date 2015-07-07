class Stock < ActiveRecord::Base
  acts_as_votable
  mount_uploader :stck_img, StckImgUploader
  belongs_to :user
  belongs_to :category
  belongs_to :store
end
