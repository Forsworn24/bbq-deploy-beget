# MYMEGABARBECUE

## Description

Application for creating events. After registration, the user can create events that can be subscribed to, which can be commented on, as well as add new photos. An event can be created, both public and private, using a pincode.

You can see an example of a working application by clicking on the following link: [mymegabarbecue](http://mymegabarbecue.store/)

## Application functionality

### You need the following extensions to run the application
```
Ruby version: 3.1.2
```
```
Rails version: 6.1.6.1
```

### Application guide

**Possible functionality that you can implement**
- Uploading and storing photos

Photos are uploaded via ActiveStorage. You can register and connect your cloud storage using [Yandex Cloud Storage](https://cloud.yandex.ru/services/storage)

1. Get your secret and public keys from Yandex Cloud Storage.
2. Add this data in your `credentials.yml`

Example:
```
cd config/credentials.yml.enc
EDITOR=vi rails credentials:edit 
```
```
yc:
  access_key_id: <your_public_key>
  secret_access_key: <your_secret_key>
```

- Sending and mailing letters

You can send emails using [Mailjet](https://app.mailjet.com/). 
To do this, you will need to register on the site and connect the public and private keys to the login details inside the application (credentials):
1. Get your secret and public keys from Mailjet.
2. Add this data in your `credentials.yml`

Example:
```
cd config/credentials.yml.enc
EDITOR=vi rails credentials:edit 
```
```
mailjet:
  api_key: <your_api_key>
  secret_key: <your_secret_key>
  sender: <your_sender_email>
```
- You can enable authentication via Github and Google

A detailed connection guide can be found at the following sources:

1. [OmniAuth](https://github.com/omniauth/omniauth)
2. [GoogleOauth](https://github.com/zquestz/omniauth-google-oauth2)
3. [GithubOauth](https://github.com/omniauth/omniauth-github)

An example of adding data to `credentials.yml`:
```
omniauth:
  github:
    id: <your_user_id>
    secret: <your_secret_key>
  google:
    id: <your_user_id>
    secret: <your_secret_key>
```
- To connect the map and determine the geolocation of your event, use YandexMaps (full guide you can get from [Api Yandex Maps For Developers](https://yandex.ru/dev/maps/?p=realty))

An example of adding data to `credentials.yml`:

```
map:
  api_key: <your_api_key>
```

- Devise and Pundit are used for authentication and authorization in the application:
1. [Device](https://github.com/heartcombo/devise)
2. [Pundit](https://github.com/varvet/pundit)

- Background tasks use ActiveJobs, Rescue and Redis

1. [ActiveJob tutorial](https://edgeguides.rubyonrails.org/active_job_basics.html)
2. [Rescue](https://github.com/resque/resque)
3. [Redis tutorial](https://www.rubyguides.com/2019/04/ruby-redis/)

- To work with photos in the application, [Lightbox2](https://lokeshdhakar.com/projects/lightbox2/) is used

### Launching guide

- Presets

1. Clone the repository and navigate to the project folder
2. Install the required gems

```
bundle install
```
3. Create a database, run migrations
```
bundle exec rails db:create
```
```
bundle exec rails db:migrate
```
4. Compile your assets
```
bundle exec rails assets:precompile
```
5. Run a local server to test the application
```
bundle exec rails s
```
