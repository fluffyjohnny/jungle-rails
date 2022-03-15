require 'rails_helper'
require 'products_controller'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do 
      @category = Category.create(name:"Boats")
    end

    it 'Saves a valid product' do
      boat = Product.new(
      name: "Bokchoy",
      price_cents: 20000,
      quantity: 1,
      category_id: @category.id
      )
      expect(boat).to be_present
    end

    it 'Validates name' do
      boat = Product.new(
      name: nil,
      price_cents: 100,
      quantity: 3,
      category_id: @category.id
      )
      expect(boat).to_not (be_valid)
      expect(boat.errors.full_messages).to include("Name can't be blank")
    end 

    it 'Validates price' do
      boat = Product.new(
      name: "Bonsai",
      price_cents: nil,
      quantity: 1,
      category_id: @category.id
      )
      expect(boat).to_not (be_valid)
      expect(boat.errors.full_messages).to include("Price can't be blank")
    end 

    it 'Validates quantity' do
      boat = Product.new(
      name: "Fish",
      price_cents: 5000,
      quantity: nil,
      category_id: @category.id
      )
      expect(boat).to_not (be_valid)
      expect(boat.errors.full_messages).to include("Quantity can't be blank")
    end 

    it 'Validates category' do
      boat = Product.new(
      name: "iPhone",
      price_cents: 1000,
      quantity: 1,
      category_id: nil
      )
      expect(boat).to_not (be_valid)
      expect(boat.errors.full_messages).to include("Category can't be blank")
    end 

  end
end