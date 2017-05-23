class Store < ActiveRecord::Base
has_and_belongs_to_many(:brands)

    validates :store_name, uniqueness:{case_sensitive: false}
    validates(:store_name, {:presence => true, :uniqueness => true, :length => { :maximum => 100 }})
    before_save(:capitalize_store)

    private

    def capitalize_store
      self.store_name = (store_name().capitalize())
    end

  end
