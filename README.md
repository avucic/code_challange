# Pizzabot

The most famous pizza delivery bot :)

## Task

The pizza delivery vehicle has to deliver the pizza across multiple locations.
The task is to create a route with directions for each location.

Based on the given coordinates (locations) that the vehicle must visit and dimension of the Cartesian coordinate plane,
draw a route using the following labels:

    N - North
    E - East
    S - South
    W - West
    D - Drop

- Mark for each location (coordinate) when vehicle arrive with D representing delivery (drop).

- Vehicle always starts from location (0x0).

### Example:

Given input:

    '5x3 (1,3) (4,4)'

Expected Output:

    ENNNDEEEND

### Requirement:

- Create a CLI that is able to parse the given input and display the result.

### Bonus:

- Shortest path to cover all coordinates.

## Installation

```ruby
bundle install
```

to make sure everything is ok run tests:

```ruby
bundle exec rspec
```

## Getting stared

Run command from the root of the directory

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
