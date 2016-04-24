class Item < ActiveRecord::Base
	has_many :orders, dependent: :destroy
	accepts_nested_attributes_for :orders, :reject_if => :all_blank, :allow_destroy => true

	validates :description, presence: true
  	validates :units, presence: true
  	validates :code, presence: true
  	validates :demand, presence: true

end
