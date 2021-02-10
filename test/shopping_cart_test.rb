require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test

  def setup
    @cart = ShoppingCart.new("King Soopers", "30items")
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
    @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    @product4 = Product.new(:produce, 'apples', 0.99, '20')
  end

  def test_it_exists
    assert_instance_of ShoppingCart, @cart
  end

  def test_it_has_readable_attributes
    assert_equal "King Soopers", @cart.name
    assert_equal 30, @cart.capacity
    assert_equal [], @cart.products
  end

  def test_it_can_add_products_to_products_array
    @cart.add_product(@product1)
    @cart.add_product(@product2)

    assert_equal [@product1, @product2], @cart.products
  end

  def test_it_can_return_information_when_calling_details_method
    result = {name: "King Soopers", capacity: 30}
    assert_equal result, @cart.details
  end

  def test_can_count_number_of_products
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    assert_equal 13, @cart.total_number_of_products
  end

  def test_capacity_checker_returns_boolean
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)
    assert_equal true, @cart.capacity_checker
  end

  def test_can_check_products_array_is_full
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    assert_equal false, @cart.is_full?
  end

  def test_it_can_return_an_array_of_products_by_category
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    results = [@product1, @product3]

    assert_equal results, @cart.products_by_category(:paper)
  end
  
end
