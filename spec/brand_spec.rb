require("spec_helper")


describe(Brand) do
  it("shows if there is a name or not") do
    brand = Brand.new({:shoe_name => ""})
    expect(brand.save()).to(eq(false))
  end
  it("assures that a brand name entry can only be used once in the database") do
    brand1 = Brand.create({:shoe_name => "nike"})
    brand2 = Brand.new({:shoe_name => "nike"})
    expect(brand2.save()).to(eq(false))
  end
  it("ensures the length of the brand name is no more than 100 characters") do
    brand = Brand.new({:shoe_name => "a".*(101)})
    expect(brand.save()).to(eq(false))
  end
end
