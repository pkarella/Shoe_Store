require("spec_helper")

describe(Store)do
  it("shows if there is a name or not") do
    store = Store.new({:store_name => ""})
    expect(store.save()).to(eq(false))
  end
  it("assures that a store name entry is unique in the database") do
    store1 = Store.create({:store_name => "sams super shoe store"})
    store2 = Store.new({:store_name => "sams super shoe store"})
    expect(store2.save()).to(eq(false))
  end
  it("ensures the length of the store name is no more than 100 characters") do
    store = Store.new({:store_name => "a".*(101)})
    expect(store.save()).to(eq(false))
  end
    it("Capitalizes the first letter of every word in a store name") do
      store = Store.create({:store_name => "peter shoe palace"})

      expect(store.name()).to(eq("Peter shoe palace"))
    end

  describe('#brands') do
    it('each store can have many brands') do
      store = Store.create({:store_name => "Peter shoe palace"})
      brand1 = store.brands.create({:shoe_name => 'nike'})
      brand2 = store.brands.create({:shoe_name => 'reebok'})
      expect(store.brands()).to(eq([brand1, brand2]))
    end
  end
end
