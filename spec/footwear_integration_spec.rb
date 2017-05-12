require "spec_helper"

describe 'the index landing page', {:type => :feature} do
  it 'shows title and introduces site navigation' do
    visit '/'
    expect(page).to have_content "Footwear Distribution Center"
  end
end
