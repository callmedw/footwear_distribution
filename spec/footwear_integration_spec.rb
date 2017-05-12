require "spec_helper"

describe 'the index landing page', {:type => :feature} do
  it 'shows title and introduces site navigation' do
    visit '/'
    expect(page).to have_content "Footwear Distribution Center"
  end
end

describe 'the add a new brand pathway', {:type => :feature} do
  it 'ENTER STUFF HERE' do
    visit '/'
    expect(page).to have_content "Footwear Distribution Center"
    click_link('brands')
    expect(page).to have_content "Add a new brand to distribution"
    fill_in('name', :with => 'Cool Shoe Brand')
    fill_in('cost', :with => 500.00)
    click_button('Add Brand')
    expect(page).to have_content "Cool Shoe Brand"

  end
end
