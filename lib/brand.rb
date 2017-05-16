class Brand < ActiveRecord::Base
 has_many :prices
 has_many :stores, through: :prices

 validates(:shoe_name, {:presence => true, :uniqueness => true, :length => { :maximum => 100 }})
 before_save(:capitalize_shoe)

 private

 def capitalize_shoe
   self.shoe_name = (shoe_name().capitalize())
 end
end
