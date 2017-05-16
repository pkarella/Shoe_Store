class Store < ActiveRecord::Base
  has_many :prices
    has_many :brands, through: :prices

    validates(:store_name, {:presence => true, :uniqueness => true, :length => { :maximum => 100 }})
    before_save(:capitalize_store)

    private

    def capitalize_store
      self.store_name = (store_name().capitalize())
    end

  end
