class Type < ActiveRecord::Base
  has_many :product
  has_many :size
end
