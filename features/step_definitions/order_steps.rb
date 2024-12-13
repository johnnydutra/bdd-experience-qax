Given('that I have initiated the purchase of the {string} item') do |product_name|
  @home.select(product_name)
end

When('I search for the following CEP: {string}') do |zip_code|
  @checkout.find_zip_code(zip_code)
end

When('provide address details:') do |table|
  @checkout.fill_address(table.rows_hash)
end

When('select {string} as payment option') do |payment_option|
  @checkout.select_payment(payment_option)
end

When('finish checkout') do
  @checkout.finish_checkout
end

Then('I am redirected to the confirmation page') do
  @confirmation.is_at
end

Then('the delivery time should be displayed as {string}') do |delivery_time|
  @confirmation.assert_delivery_time(delivery_time)
end