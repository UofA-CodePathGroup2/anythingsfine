# Group Project - Anything's Fine

Anything's Fine is a recommendation and social media app for food.  People often do not know what to eat, so they can use this app to
get a recipe, restaurant, snack, or food recommendation.  They can also view the social media page of the app to see what their friends are eating.
Everyone has to eat so there is sure to be plenty of opportunity to use Anything's Fine.  Creativity can be expressed as users can share their
favorite recipes and take fun photos of their food creations.

Time spent: **4** hours spent in total

## User Stories

The following **required** functionality is completed:

- [ ] User can sign up to create a new account
- [ ] User can log in and log out of his or her account
- [ ] The current signed in user is persisted across app restarts
- [ ] User can request a recipe recommendation
- [ ] User can request a restaurant recommendation based upon location
- [ ] User can pick from specific categories for each recommendation
- [ ] User can access the social media page of the app
- [ ] User can take photos while staying in the application
- [ ] User can access photo library to access existing photos on user's phone
- [ ] User can post an "Anything's Fine" post which has a photo and caption
- [ ] User can see table view arrangement of posts from all friends and self with most recent posts on top
- [ ] User can like posts
- [ ] User can post comments on posts

The following **stretch** features are implemented:
- [ ] User can view other users' profiles
- [ ] User can request a snack recommendation
- [ ] Users can rate/review every restaurant
- [ ] User can get directions to restaurants
- [ ] User can navigate to restaurant website from app
- [ ] User can make individual reservations from app
- [ ] User can group together with other users to decide on a recommendation
- [ ] User can save/access suggestion history
- [ ] User can create favorite items list
- [ ] User can send friend requests to other app users
- [ ] User can accept/decline friend requests from other users
- [ ] User can see trending items
- [ ] User can add allergy filters 
- [ ] User can see additional information such as calories
- [ ] Link restaurants to post


The following **additional** features are implemented:





## APIs
Recipie API: Since we want this app to fetch random recipies, we need an API to retrieve said recipies.
For this, we are thinking of using either the [Food API at Spoonacular](https://spoonacular.com/food-api) or the [Edamam API](https://developer.edamam.com/)

Search API: To retrieve restuarants in the area, we're going to need to use a eating location search tool. The most well known API is the [Yelp API](https://www.yelp.com/developers), so we've elected to use that.

Parse: WIll be backbone to social media aspect of this project. Will hold the post component as well as the account profile components.


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

### Recipie
- Meal time (Breakfast, lunch, dinner)
- Meal type (eat out, eat in)
- Meal name
- Meal tags
- Meal summary
- Meal ingredients
- Meal instructions


## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://imgur.com/SVZ1VPG.png' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

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
