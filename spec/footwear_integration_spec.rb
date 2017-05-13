require "spec_helper"

describe 'the index landing page', {:type => :feature} do
  it 'shows title and introduces site navigation' do
    visit '/'
    expect(page).to have_content "Footwear Distribution Center"
  end
end

describe 'the create, update, and delete a brand pathway', {:type => :feature} do
  it 'follows the path from creation to update to deletion of a brand in distribution' do
    visit '/'
    expect(page).to have_content "Footwear Distribution Center"
    click_link('brands')
    expect(page).to have_content "Add a new brand to distribution"
    fill_in('name', :with => 'Cool Shoe Brand')
    fill_in('cost', :with => 500.00)
    click_button('Add Brand')
    expect(page).to have_content "Cool Shoe Brand"
    click_link('Cool Shoe Brand')
    expect(page).to have_content "Update Cool Shoe Brand"
    fill_in('name', :with => 'Cooler Shoe Brand')
    fill_in('cost', :with => 1000.00)
    click_button('Update')
    expect(page).to have_content "Cooler Shoe Brand"
    click_link('Cooler Shoe Brand')
    expect(page).to have_content "Remove Cooler Shoe Brand"
    click_button('Remove Cooler Shoe Brand')
    expect(page).to have_content "Brands"
  end
end

describe 'the create, update, and delete a store pathway', {:type => :feature} do
  it 'follows the path from creation to update to deletion of a store in distribution' do
    visit '/'
    expect(page).to have_content "Footwear Distribution Center"
    click_link('stores')
    expect(page).to have_content "Enter store name here"
    fill_in('name', :with => 'Cool Shoe Store')
    click_button('Add Store')
    expect(page).to have_content "Cool Shoe Store"
    click_link('Cool Shoe Store')
    expect(page).to have_content "Update Cool Shoe Store"
    fill_in('name', :with => 'Cooler Shoe Store')
    click_button('Update')
    expect(page).to have_content "Cooler Shoe Store"
    click_link('Cooler Shoe Store')
    expect(page).to have_content "Remove Cooler Shoe Store"
    click_button('Remove Cooler Shoe Store')
    expect(page).to have_content "Stores"
  end
end
