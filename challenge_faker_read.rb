load 'ar.rb'
require 'faker'

# Find all the categories in the database (including those that you added using Faker).
categories = Category.all

# Display the category names
categories.each {
    | category |
    puts "Category: #{category.name}"
}

all_categories = Category.all
puts "\nThe total number of categories are #{all_categories.size}"

# Display all category names and their associated products (name and price) in a nicely formatted list.
# Display the categories and their products
categories = Category.includes(:products).all

categories.each {
    | category |
    puts "Category: #{category.name}"

    category.products.each {
        | product |
        puts "\tProduct: #{product.name}, Price: $#{'%.2f' % product.price}\n"
    }
    puts "\n"
}
