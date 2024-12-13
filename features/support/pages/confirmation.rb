require 'rspec'

class ConfirmationPage
  include Capybara::DSL
  include RSpec::Matchers

  def is_at
    expect(find('h1').text).to eql 'Uhull! Pedido confirmado'
    expect(find('p[color=subtitle]').text).to eql 'Agora é só aguardar que logo o café chegará até você'
  end

  def assert_delivery_time(expected)
    delivery_time = find('p', text: 'Previsão de entrega')
    expect(delivery_time.find('strong').text).to eql expected
  end
end