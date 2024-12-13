require 'rspec'

class CheckoutPage
  include Capybara::DSL
  include RSpec::Matchers

  def assert_product_details(product)
    product_title = find('.item-details h1')
    expect(product_title.text).to eql product[:name]
  
    sub_price = find('.subtotal .sub-price')
    expect(sub_price.text).to eql product[:price]
  
    delivery = find('.delivery-price')
    expect(delivery.text).to eql product[:delivery]
  end

  def assert_order_total(amount)
    total = find('.total-price')
    expect(total.text).to eql amount
  end

  def find_zip_code(zip_code)
    find('input[name=cep]').set(zip_code)
    click_on 'Buscar CEP'
  end

  def fill_address(address)
    find('input[name=number]').set(address[:number])
    find('input[name=complement]').set(address[:complement])
  end

  def select_payment(payment_option)
    find('label div', text: payment_option.upcase).click
  end

  def finish_checkout
    click_on 'Confirmar pedido'
  end

end