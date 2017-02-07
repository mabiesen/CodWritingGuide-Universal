# README

Application represents a successful attempt at scaffolding, db creation, and user interaction with the database.

Directions taken:

####1. Create the application (rails new)
```
rails _5.0.1_ dbtest_app
```

####2. Create the controller for web pages, web pages
```
rails generate controller home index

  Note: the controller and view folder is named Home, the page create is named index.
```

####3. Scaffold to generate database named Post
```
rails generate scaffold Post name:string title:string content:text

  Note: Name of database must be singular, referenced url is plural
```

####4. Migrate the database
```
rake db:migrate
```

####5. Set the root route to home#index
```
root 'home#index'
```

####6. Rake once more - Rails searches for and reports errors
```
rake
```

####7. Alter the index html to reference posts pages
```
<%= link_to "My Blog", posts_path %>

  Note: "My Blog" is just a name, no significance
```

####8. Rails server to test the application. Your done!

Directions came directly from https://doc.bccnsoft.com/docs/rails-guides-3.2-en/getting_started.html
