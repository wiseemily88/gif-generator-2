#  GifGenerator

This is a Mod 2 solo project, that is my first project where I consume an external API to render data. The app allows the users to "favorite gifs". An admin user can randomly create gifs using the Giphy API. Admins create a category via the search term entered to generate the gif. They are also able to delete a single gif or category with all gifs associated to it.
App deployed on https://git.heroku.com/gif-generator-emily-wise.git

#### This app was created with:

* Ruby version 2.4.1
* Rails 5.1.4

#### Getting Started

Run the following terminal commands:
* git clone
* bundle
* rake db:create db:migrate
* rails s
* Now that your local server is running you can open the app in your browser from localhost:portnumber This should bring you to the welcome page.

Creating an Admin

To create an admin locally:

Run rails c from terminal
Input User.create(username: "YOUR TEXT", password: "YOUR TEXT", role: 1)
You are now able to login using the admin user you have just created.
