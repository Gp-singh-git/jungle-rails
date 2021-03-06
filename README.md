# Jungle

A mini e-commerce application built with Rails 4.2, showing products that can be added to card and payment facility through stripe. 

Some features added: - 
- conditional formatting for Empty Cart, sold out badge
- Separate Admin login
- Admin Dashboard with counts for products
- User Authentication
- TDD and BDD, tested pages using Rspec Capybara and Poltergiest.


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

## Screenshots
![Home Page](https://github.com/Gp-singh-git/jungle-rails/blob/master/public/images/homepage.png?raw=true)
![Products](https://github.com/Gp-singh-git/jungle-rails/blob/master/public/images/product_dashboard.png?raw=true
)
![Categories](https://github.com/Gp-singh-git/jungle-rails/blob/master/public/images/categories.png?raw=true)
![Cart](https://github.com/Gp-singh-git/jungle-rails/blob/master/public/images/cart.png?raw=true)
