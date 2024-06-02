require_relative 'ar.rb'

# READING DB ROWS WITH ACTIVE RECORD
puts Product.inspect

# We can call .count on the Product class to count all the rows.
# This will generate the following SQL:
# SELECT COUNT(*) FROM product;

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

# # To record all the columns that exist in the products table
all_products = Product.all


# # To print out all the number of products
puts "The total number of products are #{all_products.size}"

# # Names of all products above $10 with names that begin with letter "C"
products_above_10_with_c = Product.where('price > ? AND name LIKE ?', 10, 'C%').pluck(:name)
puts "Products above $10 with names starting with 'C':"
products_above_10_with_c.each { |name| puts name}

# # Find the total number of products with a low stack quantity (less than 5)
low_stock_count = Product.where('stock_quantity < ?', 5).count
puts "Total number of products with a low stock quantity: #{low_stock_count}"





# Add to the challenge_read.rb file:
# Find the name of the category associated with one of the products you have found.
# (You should do this without referencing the products foreign key value.
#  Use the product's "belongs to" association instead.)

# Find a product
product = Product.first

# Ensure a product was found
if product
  # Retrieve the associated category
  category = product.category

  # Check if the category exists
  if category
    puts "\tProduct Name: #{product.name}, Category Name: #{category.name}"
  else
    puts "Category not found for product: #{product.name}"
  end
else
  puts "Product not found."
end


# This script will find all products and print their names along with the names of their associated categories.
# products = Product.all

# products.each do |product|
#   # Retrieve the associated category
#   category = product.category

#   # Print the product and category names
#   if category
#     puts "Product Name: #{product.name}, Category Name: #{category.name}"
#   else
#     puts "Product Name: #{product.name}, Category: Not found"
#   end
# end




# Find a specific category and use it to build and persist a new product associated with this category

beverages = Category.where(:name => 'Beverages').first

new_product = beverages.products.build(
    name: "Strawberry Slush",
    description: "24 - 4 oz jar",
    price: 10,
    stock_quantity: 76
)

new_product.save

puts new_product.inspect




# Find a specific category and then use it to locate all the the associated products over a certain price.
confections = Category.find_by(name: 'Confections')

if confections
  products_over_price = confections.products.where('price > ?', 10.00)

  if products_over_price.any?
    puts "\nProducts in the 'confections' category with price over $10:"
    products_over_price.each do |product|
      puts "\tName: #{product.name}, Price: $#{product.price}"
    end
  else
    puts "No products found in the 'confections' category with price over $10."
  end
else
  puts "Category 'confections' not found."
end
