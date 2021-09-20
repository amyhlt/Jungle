require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
   
    it "return a new product with valid attributes" do
      @category= Category.create(name:"Nike")
      @product=Product.create!(
               name:  'Optimal Sleeping Bed',
                description: Faker::Hipster.paragraph(4),
                quantity: 320,
                price: 3_052.00,
                category_id: @category.id
               )
    expect(Product.all.count).to eql(1)
    end
    it "is not valid without name" do
      @category= Category.create(name:"Nike")
      @product=Product.new(
             name:  nil,
              description: Faker::Hipster.paragraph(4),
              quantity: 320,
              price: 3_052.00,
              category_id: @category.id
             )
       expect(@product).to_not (be_valid)
    end
    it "is not valid without price" do
      @category= Category.create(name:"Nike")
      @product=Product.new(
             name:  nil,
              description: Faker::Hipster.paragraph(4),
              quantity: nil,
              price: 3_052.00,
              category_id: @category.id
             )
       expect(  @product).to_not (be_valid)
    end
    it "is not valid without quantity" do
      @category= Category.create(name:"Nike")
      @product=Product.new(
             name:  nil,
              description: Faker::Hipster.paragraph(4),
              quantity: 320,
              price: nil,
              category_id: @category.id
             )
       expect( @product).to_not (be_valid)
    end
    it "is not valid without category" do
      @category= Category.create(name:"Nike")
      @product=Product.new(
             name:  nil,
              description: Faker::Hipster.paragraph(4),
              quantity: 320,
              price: 3_052.00,
              category_id: nil
             )
       expect( @product).to_not (be_valid)
    end
  end
end
