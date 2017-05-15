class Brand < ActiveRecord::Base
   belongs_to(:store)
   validates(:shoe_name, {:presence => true, :length => {:maximum => 51}})



   private
     define_method(:capitalize_store_name) do
    end
end
