class Setting < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :value, presence: true
end
