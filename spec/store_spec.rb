require "spec_helper"

describe(Store) do
  it { should have_and_belong_to_many(:brands) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }


  it("returns false if it's too long store name") do
    store = Store.create({name: "'It is great to be known for your shoes but it is better to be known for your sole' says Kenneth Cole, but on the other hand Cinderalla proved that a new pair of shoes can change your life"})
    expect(store.save).to eq(false)
  end
end
