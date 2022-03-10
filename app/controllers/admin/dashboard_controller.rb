class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_AUTH_USERNAME"], password: ENV['HTTP_BASIC_AUTH_PASSWORD']

  def show
    @products_count = Product.all.count
    @category_count = Category.all.count
  end
end
