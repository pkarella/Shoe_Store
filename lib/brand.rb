class Brand < ActiveRecord::Base
 has_and_belongs_to_many(:stores)

validates :shoe_name, uniqueness:{case_sensitive: false}
 validates(:shoe_name, {:presence => true, :uniqueness => true, :length => { :maximum => 100 }})
 before_save(:capitalize_shoe)

 private

 def capitalize_shoe
   self.shoe_name = (shoe_name().capitalize())
 end
end
