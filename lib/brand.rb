class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, {:length => { :maximum => 100 }})
  validates(:name, presence: true)
  validates(:cost, presence: true)
end
