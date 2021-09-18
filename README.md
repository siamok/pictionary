# README
## About:
App is based on a project from a John Elder's book 'Ruby on Rails'. It is set to practice, learn and expand my knowledge on Ruby on Rails.

Pins contain author's name, description and attachment [image] which is stored in a local database.
Pins can be rated by logged users. Average rating is displayed, as well as rating posted by logged user (if rated).

User can rate, add (new), edit (owned), browse (all) and delete (owned) pins.

## Ruby/Rails version
2.7 / 5.2.3

## Configuration
> bundle install \
> rake db:create \
> rake db:migrate \
> rails s

## Testing
> rspec
