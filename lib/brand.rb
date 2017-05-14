class Brand < ActiveRecord::Base
   belongs_to(:store)
   validates(:shoe_name, {:presence => true, :length => {:maximum => 51}})
end
