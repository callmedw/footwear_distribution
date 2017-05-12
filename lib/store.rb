class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, {:length => { :maximum => 100 }})
  validates(:name, presence: true)
  validates :name, uniqueness: { case_sensitive: false }
end
