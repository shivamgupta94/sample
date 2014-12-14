class Rou < ActiveRecord::Base
	belongs_to :user
	has_many :markers
end
