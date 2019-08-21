
# Pizzabot
The most famous pizza delivery bot :)

## Installation

```ruby
bundle install
```

to make sure everything is ok run tests:

```ruby
bundle exec rspec
```

## Getting stared

Run command from the root of the directorj

```bash
./pizzabot '5x3 (1,3) (4,4)'
```
## Notes

Durning development few questions came up related to the business model itself or
it's misunderstanding:

1. Purpose of the plane size:
    ```ruby
    '5x5 (1,3) (4,4)'
    ```
    Plane size can be calculated from given coordinates using largest `x` and `y` values, or not ?

2. Multiple similar points should give multiple D (drop)?
    ```ruby
    '5x5 (1,3) (1,3) (1,3)'
    ```
    will produce

    ```ruby
    'ENNNDDD'
    ```

