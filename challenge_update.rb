load 'ar.rb'

# Find all products with a stock quantity greater than 40
stock_quantity_above_40 = Product.where('stock_quantity > ?', 40)

product_stock_quantity_above_40 = stock_quantity_above_40.size
puts "\nThe total number of stock quantity above 40 is: #{product_stock_quantity_above_40}"

# Print out all the products with more than 40 stock quantity
stock_quantity_above_40.each {
    |product|
    puts "Product ID: #{product.id}, Name: #{product.name}, Stock Quantity: #{product.stock_quantity}."
}

# Increment the stock quantity of each of these products by one
stock_quantity_above_40.each {
    | product |
    product.stock_quantity += 1
    product.save
}

puts "\nUpdated stock quantities for products with stock quantity greater than 40."
