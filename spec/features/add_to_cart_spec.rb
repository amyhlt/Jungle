require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end
    scenario "Cart updates by one" do
      # ACT
      visit root_path
      first('.product').click_link('Add' )
      # DEBUG /
      expect(page).to have_text 'My Cart (1)'
      save_screenshot
      puts page.html
  
    end 
end