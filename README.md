# Anything's Fine

Anything's Fine is a recommendation and social media app for food.  People often do not know what to eat, so they can use this app to get a recipe, restaurant, snack, or food recommendation.  They can also view the social media page of the app to see what their friends are eating.
Everyone has to eat so there is sure to be plenty of opportunity to use Anything's Fine.  Creativity can be expressed as users can share their favorite recipes and take fun photos of their food creations.

## Features

Base Functionality:
- Sign up to create a new account
- Log in and log out of account
- Current signed in user is persisted across app restarts
- Recipe recommendation
- Restaurant recommendation based upon location
- Specific categories for each recommendation
- Social media page
- Take photos within the application
- Access photo library
- Create and share an "Anything's Fine" post that includes a photo, caption, and/or restaurant name
- View TableView of friend's posts
- Like posts
- Post comments 

Additional Features:
- Updated Feed View Color Scheme
- Add restaurant name to a post
- App contains loading indicators
- Custom app icon
- Custon tab bar glyphs
- Snack recommendation requests
- Navigate to recipe recommendation website in app
- View other users' profile & posts
- Get directions to restaurant
- Navigate to restaurant yelp page

## Video Walkthrough



## Demo Video Link

https://www.youtube.com/watch?v=-rU_RD-XD_o

## APIs
Recipe API: To retrieve recipies, we used the [Edamam API](https://developer.edamam.com/).

Search API: To retrieve restuarants in the area, we used the [Yelp API](https://www.yelp.com/developers).

Parse: Used as the backbone to social media aspect of this project. Holds post objects and can "like" and "comment" posts.

## Parse Components

### Profiles

- Username
- Password
- Full name

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

## Credits

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- [Parse](https://devcenter.heroku.com/articles/deploying-a-parse-server-to-heroku) - back-end library

## Notes

The hardest part of building this app was getting the concept translated from the idea to the execution. In addition, selecting the correct APIs to use and harnessing their capabilities proved to be difficult in making this app.

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
