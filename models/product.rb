class Product < ActiveRecord::Base
  # This AR object is linked with the products table.

  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.
  belongs_to :category

  # Validation: A product must have all columns (other than foreign keys, the id, or datetime column)
  # filled out before it can be saved to the db

  validates :name, :description, :price, :stock_quantity, presence: true

  # Validation: Ensure that all product names are unique and longer than 3 characters
  validates :name, uniqueness: true, length: { minimum: 4 }
end
