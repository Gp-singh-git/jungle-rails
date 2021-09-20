require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'shows no name for new records' do
      @product = Product.new
      @category = Category.new

      expect(@product.name).to be_nil

    end

    it 'shows all 4 values to be present if all are set' do
    @category = Category.create(name: 'Apparel')
    @product = Product.create(name: 'pro1', category: @category, quantity: 4, price:105)
    @product.save
    expect(@product).to be_valid
    end

    it 'shows error for nil name' do
      @category = Category.create(name: 'Apparel')
      @product = Product.create(name: nil, category: @category, quantity: 4, price:105)
  
  
    expect(@product.errors.full_messages[0]).to eq "Name can't be blank"
    end

    it 'shows error for nil quantity' do
      @category = Category.create(name: 'Apparel')
      @product = Product.create(name: 'backpack', category: @category, quantity: nil, price: 200)
      expect(@product.errors.full_messages[0]).to eq "Quantity can't be blank"
    end

    it 'shows error for nil category' do
      @product = Product.create(name: 'backpack', category: nil, quantity: 2, price: 200)
      expect(@product.errors.full_messages[0]).to eq "Category can't be blank"
    end

    it 'shows error for price being not a number' do
      @category = Category.create(name: 'Apparel')
      @product = Product.create(name: 'backpack', category: @category, quantity: 2, price: nil)
      expect(@product.errors.full_messages[0]).to eq "Price cents is not a number"
    end

  end
end
