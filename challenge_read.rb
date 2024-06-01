require_relative 'ar.rb'

# READING DB ROWS WITH ACTIVE RECORD

# We can call .count on the Product class to count all the rows.
# This will generate the following SQL:
# SELECT COUNT(*) FROM product;

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

# To record all the columns that exist in the products table
all_products = Product.all


# To print out all the number of products
puts "The total number of products are #{all_products.size}"

# Names of all products above $10 with names that begin with letter "C"
products_above_10_with_c = Product.where('price > ? AND name LIKE ?', 10, 'C%').pluck(:name)
puts "Products above $10 with names starting with 'C':"
products_above_10_with_c.each { |name| puts name}

# Find the total number of products with a low stack quantity (less than 5)
low_stock_count = Product.where('stock_quantity < ?', 5).count
puts "Total number of products with a low stock quantity: #{low_stock_count}"
