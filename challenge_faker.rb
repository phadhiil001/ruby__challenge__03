load 'ar.rb'
require 'faker'

# Create 10 new categories
(1..10).each {
  category_name = Faker::Commerce.unique.department
  category = Category.create(name: category_name)

  # Create 10 new products for each category
  (1..10).each {
    category.products.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price(1.0, 100.0),
      stock_quantity: Faker::Number.between(1, 100)
    )
  }
}
