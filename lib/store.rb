class Store < ActiveRecord::Base
  has_many(:brands)
  validates(:store_name, {:presence => true, :length => {:maximum => 51}})
  before_save(:capitalize_store_name)

private
  define_method(:capitalize_store_name) do
    self.store_name= (store_name().each()do|store|
    store.capitalize()
  end)
end
  end
