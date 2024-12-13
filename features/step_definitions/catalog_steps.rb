When('I access the Starbugs home page') do
  @home.open
end

Then('I should see a list of available products') do
  expect(@home.product_list.size).to be > 0
end

Given('that I am at the Starbugs homepage') do
  @home.open
end

When('I start the purchase of that item') do
  @home.select(@product[:name])
end

Then('I should see the checkout page with the product details') do
  @checkout.assert_product_details(@product)
end

Then('the order total should be {string}') do |order_total|
  @checkout.assert_order_total(order_total)
end

Then('I should see a popup stating that the product is unavailable') do
  @popup.has_text('Produto indisponível')
end

Given('I want to purchase a product:') do |table|
  @product = table.rows_hash
end