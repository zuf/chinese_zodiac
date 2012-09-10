# chinese_zodiac

`chinese_zodiac` is a simple gem for getting a animal sign from a given date. 

## Installation

``` bash
gem install chinese_zodiac
```

Or, if you want to extend your rails app, add the following to the `Gemfile`:

``` ruby
gem 'chinese_zodiac'
```

and run `bundle install`.

## Usage

``` ruby
require 'chinese_zodiac'
ChineseZodiac.animal_sign(Time.now.to_date)  # => "Dragon"
```

`ChineseZodiac.animal_sign` returns values using `I18n` with "chinese_zodiac.#{animal_sign}" path, so if you want your own translations, you can put them in your locale with keys like `chinese_zodiac.rat`, `chinese_zodiac.dragon` etc. See examples [here](http://github.com/evgeniynickolaev/chinese_zodiac/blob/master/lib/locales/en.yml).


## Included locales

* en (English)
* ru (Russian)

## Changelog

* 0.0.1 Initial version with [:ru, :en] locales

## Roadmap

1. Unit test

## Contributing

Fork the repository, push your changes to a topic branch and send me a pull request.
