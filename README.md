# Agery

Agery is a set of extensions to Ruby's `Integer` class to assist developers
in generating arrays of ages. It's similar to ActiveSupport's extensions for
calculating bytes (`1.megabyte`) or durations (`3.days`). It's designed to
help generate data used when pricing is dependent upon age.

For example, a movie ticket may cost $13.99 for an adult, $4.99 for a young
child, $7.99 for a senior citizen, and free for infants. Also the movie may
be rated for mature audiences and not permit teenagers without an adult.

Since the primary use case is for pricing calculations, adults are treated as
an undefined age (`-1`) which would correspond to the most expensive price.
Also children default to `0` to ensure they will trigger the least expensive
price.

## Examples

* `1.adult #=> [-1]`
* `3.teenagers #=> [13, 13, 13]`
* `2.infants #=> [0, 0]`
* `0.children #=> []`
* `2.seniors #=> [65, 65]`
* `2.adults + 1.child #=> [-1, -1, 0]`
* `1.over_21 #=> [21]`
* `2.under_18 #=> [17, 17]`

## Customization

You can override Agery's concept of the age of an adult, infant, child,
teenager, and senior by overriding the Agery constant of the same name.

## Installation

`gem install agery`
