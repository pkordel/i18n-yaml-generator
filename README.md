# I18n yaml generator (for Rails 3)

## Description

Creates yaml locale files for models and views when using the model / scaffold_controller generators.

Locale files are generated for all locales listed in I18n.available_locales.

#### Currently support ORMs

* ActiveRecord
* ActiveModel
* Mongoid

## Usage

Add the gem to Gemfile

    gem 'i18n_yaml_generator'

Make sure you have something like this in application.rb:

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

## Configuration

Create config/initializers/i18n_yaml_generators.rb

    MyApplication::Application.config.i18n_yaml_generator.tap do |g|
    
      # Whether content in the generated locale files should be commented out (default: false)
      g.commented = true 

    end

## Example

    rails g scaffold Article title:string body:text
          invoke  active_record
          create    db/migrate/20110329004811_create_articles.rb
          create    app/models/article.rb
          invoke    test_unit
          create      test/unit/article_test.rb
          create      test/fixtures/articles.yml
          invoke  i18n_yaml
          create    config/locales/models/article.en.yml
           route  resources :articles
          invoke  scaffold_controller
          create    app/controllers/articles_controller.rb
          invoke    erb
          create      app/views/articles
          create      app/views/articles/index.html.erb
          create      app/views/articles/edit.html.erb
          create      app/views/articles/show.html.erb
          create      app/views/articles/new.html.erb
          create      app/views/articles/_form.html.erb
          invoke    test_unit
          create      test/functional/articles_controller_test.rb
          invoke    helper
          create      app/helpers/articles_helper.rb
          invoke      test_unit
          create        test/unit/helpers/articles_helper_test.rb
          invoke    i18n_yaml
          create      config/locales/views/articles.en.yml
          invoke  stylesheets
          create    public/stylesheets/scaffold.css

### config/locales/models/article.en.yml
   
    --- 
    en: 
      active_record: 
        models: 
          article: Article
        attributes: 
          article: 
            title: Title
            body: Body
        errors: 
          article: 
      helpers: 
        article: 

### config/locales/views/articles.en.yml

    --- 
    en: 
      articles: 
        index: 
          title: Articles
        show: 
          title: Article
        edit: 
          title: Editing Article
        new: 
          title: New Article
      flash: 
        articles: 
          create: 
            notice: "%{resource_name} was successfully created."
          update: 
            notice: "%{resource_name} was successfully updated."
          destroy: 
            notice: "%{resource_name} was successfully deleted."
            alert: "%{resource_name} could not be deleted."

