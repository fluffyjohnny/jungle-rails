# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Users can 

## Tech Stack
Front-End: 
- ERB
- CSS
- HTML
<br>

Back-End: 
- Ruby on Rails
- PostgreSQL
<br>

Testing: 
- RSpec
- Capybara
- Poltergeist

## Demo

### Users can browse available items 
!["Products"](https://raw.githubusercontent.com/fluffyjohnny/jungle-rails/master/public/images/products.png)
!["Product Detail"](https://raw.githubusercontent.com/fluffyjohnny/jungle-rails/master/public/images/product_detail.png)

### They can add products to the cart and checkout 
!["Cart"](https://raw.githubusercontent.com/fluffyjohnny/jungle-rails/master/public/images/cart.png)
!["Checkout"](https://raw.githubusercontent.com/fluffyjohnny/jungle-rails/master/public/images/checkout.png)

### Admins can edit products and categories
!["Admin Products"](https://raw.githubusercontent.com/fluffyjohnny/jungle-rails/master/public/images/admin_products.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
