require_relative './pages/checkout.rb'
require_relative './pages/home.rb'
require_relative './pages/popup.rb'

Before do
  @checkout = CheckoutPage.new
  @home = HomePage.new
  @popup = Popup.new
end