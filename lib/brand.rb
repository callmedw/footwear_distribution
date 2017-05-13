class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, {:length => { :maximum => 100 }})
  validates(:name, presence: true)
  validates(:cost, presence: true)
  validates(:name, uniqueness: { case_sensitive: false })
  before_save(:title_case)



  define_method(:title_case) do
    words = self.name.downcase.split(' ')
    words.each do |word|
      word.capitalize!
    end
    self.name = words.join(' ')
  end


end
