omniauth_share_example
======================

This is an example of how to share on Facebook, Google+ and Twitter. 
To run the project follow this commands: 
```ruby 
bundle install
rake db:create
rake db:migrate
rails s
```

To set your clinet Id and secret key, check the `config/initializer/omniauth.rb` file

How to get client id and secret key
====================================

create app on:

facebook  : https://developers.facebook.com/apps

![Facebook](https://github.com/sonianand11/omniauth_share_example/blob/master/FB.png)

twitter : https://dev.twitter.com/apps
Note: there is a issues in callback url in twitter.
![Twitter Detail](https://github.com/sonianand11/omniauth_share_example/blob/master/TW1.png)
![Twitter Setting](https://github.com/sonianand11/omniauth_share_example/blob/master/TW2.png)

google : https://code.google.com/apis/console
![Google](https://github.com/sonianand11/omniauth_share_example/blob/master/Google.png)



