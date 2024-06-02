load 'ar.rb'

# CREATING WITH ACTIVE RECORD

# Method One: Create a Customer in "object space".
new_product = Product.new

# Setting the required properties.
new_product.name = "Taro"
new_product.description = "12 - 4 oz jar"
new_product.price = 12.23
new_product.stock_quantity = 5

# Calling save on the object
new_product.save

# Inspect the product
puts new_product.inspect


# Method Two: Create an Customer in "object space"
matcha = Product.new(
    name: "Matcha",
    description: "16 - 4 oz scoops",
    price: 4.45,
    stock_quantity: 20
)

# Calling save on the object
matcha.save


# Method Three: Create the object and persist it all at once.
kamikaze = Product.create(
    name: "Kamikaze",
    description: "24 - 4 oz drops",
    price: 7.95,
    stock_quantity: 43
)



# Create a Product object that is missing some required columns.
slush = Product.new(
    name: "Slush",
    price: 7.95
)


# Attempt to save this product and print all the AR errors which are generated.
if(slush.save)
    puts "Slush was saved to the products table"
    puts slush.inspect
else
    puts "Incomplete fields, unable to save to product table. Try again."

    slush.errors.messages.each {
        |column, errors|
        errors.each {
            |error|
            puts "The #{column} property #{error}."
        }
    }
end
