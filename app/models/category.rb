class Category < ActiveRecord::Base
	has_many :subcategories
	accepts_nested_attributes_for :subcategories, :reject_if => :all_blank, :allow_destroy => true
	validates :name, presence: true
end
