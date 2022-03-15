require 'rails_helper'
require 'products_controller'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do 
      @category = Category.new
      @product = Product.new
      @product.name = 'test product'
      @product.price_cents = 1;
      @product.quantity = 10;
      @product.category_id = @category.id;
    end

    context 'add product with correct fields' do
      it 'Saves a valid product' do
        @product.save

        expect(@product).to be_present
      end
    end

    it 'Validates name' do
      @product.name = nil
      @product.save 

      expect(@product).to_not (be_valid)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end 

    it 'Validates price' do
      @product.price_cents = nil
      @product.save 

      expect(@product).to_not (be_valid)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end 

    it 'Validates quantity' do
      @product.quantity = nil
      @product.save 
      
      expect(@product).to_not (be_valid)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end 

    it 'Validates category' do
      @product.category_id = nil
      @product.save 

      expect(@product).to_not (be_valid)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end 
  end
end