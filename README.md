# Anything's Fine

Anything's Fine is a recommendation and social media app for food.  People often do not know what to eat, so they can use this app to
get a recipe, restaurant, snack, or food recommendation.  They can also view the social media page of the app to see what their friends are eating.
Everyone has to eat so there is sure to be plenty of opportunity to use Anything's Fine.  Creativity can be expressed as users can share their
favorite recipes and take fun photos of their food creations.

## Features

Base Functionality:

- User can sign up to create a new account
- User can log in and log out of his or her account
- The current signed in user is persisted across app restarts
- User can request a recipe recommendation
- User can request a restaurant recommendation based upon location
- User can pick from specific categories for each recommendation
- User can access the social media page
- User can take photos in the application
- User can access their photo library
- User can create and share an "Anything's Fine" post that includes a photo, caption, and/or restaurant name
- User can view a TableView of their friend's posts
- User can like posts
- User can post comments on posts

Additional Features:

- Updated Feed View Color Scheme
- User can add restaurant name to a post and see that
- App contains loading indicators
- Custom app icon
- Custon tab bar glyphs
- User can request a snack recommendation
- User can navigate to recipie recommendation website in app
- User can view other users' profile & posts
- User can get directions to restaurant
- User can navigate to restaurant yelp page


## APIs
Recipe API: To retrieve recipies, we used the [Edamam API](https://developer.edamam.com/).

Search API: To retrieve restuarants in the area, we used the [Yelp API](https://www.yelp.com/developers).

Parse: Used as the backbone to social media aspect of this project. Holds post objects and can "like" and "comment" posts.


## Parse Components

### Profiles

- Username
- Password
- Full name
- Location
- Friends (Optional)

### Post Feed
- Image
- Restaurant
- Location
- Caption
- Likes
- Comments


## Model Classes

### Profile
- Username
- Hashed password

### Posts
- Food Image
- Restaurant
- Location
- Caption
- Likes
- Comments

### Recipe
- Meal time (Breakfast, lunch, dinner)
- Meal type (eat out, eat in)
- Meal name
- Meal tags
- Meal summary
- Meal ingredients
- Meal instructions

## Demo Video Link

https://www.youtube.com/watch?v=-rU_RD-XD_o


## Video Walkthrough

Here's a walkthrough of implemented user stories:

![anythingsfine](https://user-images.githubusercontent.com/31720526/49336825-847e4e80-f5c6-11e8-9a05-fd3a307b3c55.gif)


## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library


## Notes

Describe any challenges encountered while building the app.

## License

    Copyright 2018 Bohlman Ho Quevedo

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
