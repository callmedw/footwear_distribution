require "spec_helper"

describe(Brand) do
  it { should have_and_belong_to_many(:stores) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cost) }

  it("returns false if it's too long brand name") do
    brand = Brand.create({name: "'It is great to be known for your shoes but it is better to be known for your sole' says Kenneth Cole, but on the other hand Cinderalla proved that a new pair of shoes can change your life"})
    expect(brand.save).to eq(false)
  end
end
