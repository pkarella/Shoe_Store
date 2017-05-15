require("spec_helper")

describe(Store)do
  it("shows if there is a name or not") do
    store = Store.new({:store_name => ""})
    expect(store.save()).to(eq(false))
  end
  it("assures that a store name entry can only be used once in the database") do
    store1 = Store.create({:store_name => "store"})
    store2 = Store.new({:store_name => "store"})
    expect(store2.save()).to(eq(false))
  end
  it("ensures the length of the store name is no more than 100 characters") do
    store = Store.new({:store_name => "a".*(101)})
    expect(store.save()).to(eq(false))
  end
end
