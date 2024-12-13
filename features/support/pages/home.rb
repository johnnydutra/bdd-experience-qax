class HomePage
  include Capybara::DSL

  def open
    visit 'https://starbugs.vercel.app/'
  end

  def product_list
    return all('.coffee-item')
  end

  def select(product_name)
    product = find('.coffee-item', text: product_name)
    product.find('.buy-coffee').click
  end
end