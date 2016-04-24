class Order < ActiveRecord::Base
	belongs_to :item

	validates :demand, presence: true
  	validates :period, presence: true
end
