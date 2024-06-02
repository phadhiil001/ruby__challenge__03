load 'ar.rb'

# DELETING ROWS WITH ACTIVE RECORD

# Either step one or step two

taro = Product.where(:name => 'taro').first

puts taro.inspect
taro.destroy unless taro.nil?

puts taro.inspect

# STEP TWO
product_to_delete = Product.find_by(name: '["Taro", "12 - 40 oz jar", 12.23]')
puts product_to_delete
if product_to_delete
    # Delete the product
    product_to_delete.destroy
    puts "Deleted product: #{product_to_delete.name}"
  else
    puts "Product not found."
  end


all_products = Product.all
puts "The total number of products are #{all_products.size}"
