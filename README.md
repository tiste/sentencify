# Sentencify

[![Build Status](https://travis-ci.org/baptistelecocq/sentencify.png?branch=develop)](https://travis-ci.org/baptistelecocq/sentencify)
[![Coverage Status](https://coveralls.io/repos/baptistelecocq/sentencify/badge.png?branch=develop)](https://coveralls.io/r/baptistelecocq/sentencify?branch=develop)

With Sentencify, you can create sentences with array of Active Record objects.
It supports `I18n`.

It is inspired by the `to_sentence` rails method.

Example :
`Tiste, John, Pierre, Lola and 3 others`

## Installation

Add this line to your application's Gemfile:

    gem 'sentencify'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sentencify

## Usage
### Default

Considering that you have an `User` model with a `login` field:

In your controller:
```rb
def index
  @users = User.all
end
```

In your `index.html.erb` view:
```rb
@users.sentencize(on: :login)
@users.sentencize(on: :avatar, image: true)
```

It will display all your users by login with a default limit of 5.

You can change this value by passing a limit parameter as following: `limit: 10`

**Extra**: You can display images by turning the image option to true.

### Advanced
#### Parameters

Others parameters:
* `image`, default value: false
* `empty`, default value: 'No element found'
* `words_connector`, default value: ', '
* `two_words_connector`, default value: ' and '
* `last_word_connector`, default value: ' and '
* `final_singular_connector`, default value: ' other'
* `final_plural_connector`, default value: ' others'

#### I18n

You can also set the connectors via I18n by passing a dictionary into the form:
```yml
fr:
  sentencify:
    two_words_connector: ' et '
    last_word_connector: ' et '
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
