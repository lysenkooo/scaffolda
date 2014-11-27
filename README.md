# Scaffolda

Scaffold bootstrap-ready code today!

## Installation

Create new application:

```
rails _4.1.8_ new your-app-name -T -d postgresql
```

Add this line to your application's Gemfile:

```ruby
gem 'scaffolda', git: 'https://github.com/crashcube/scaffolda.git', group: :development
```

And then execute:

    $ bundle

Then add these lines to `config/application.rb`:

```ruby
config.generators do |g|
  g.template_engine :scaffolda
end
```

or use `-e scaffolda` option with `rails g scaffold`.

## Usage

```
rails g scaffold product name:string price:decimal{10,2} --no-javascripts --no-stylesheets --no-helper-specs
```

Don't forget:

Include helper in your `application_controller.rb`:

```
include ScaffoldaHelper
```

Include generated javascript file in `application.js`:

```
//= require scaffolda
```

Add JS support to scaffolded controllers:

```ruby
respond_to :html, :js
```

Add page, sorting and search methods to index action of your new controller:

```ruby
@products = Product.order(sort_query(Product)).page(current_page)
@products = @products.where('name ILIKE ?', "%#{search_query}%") unless search_query.blank?
```
