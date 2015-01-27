Alphanumeric Random
===================

By Taka Oyama

[![Build Status](https://travis-ci.org/taka-oyama/alphanumeric_random.svg?branch=master)](https://travis-ci.org/taka-oyama/alphanumeric_random)

## Information

This gem generates random alphanumeric string of specified length.
Alphanumeric string consists of A-Z, a-z, 0-9 (total of 62 chars).
*Please do the math and calculate the probability if you're using this for ID generation.

## Examples

```ruby
AlphanumericRandom.generate(length: 20)   # crr9s7fRtXw3OU85Z6z0
```

## Install
```ruby
gem 'alphanumeric_random', github: 'taka-oyama/alphanumeric_random'
```

## Methods

##### AlphanumericRandom.generate(options = {})
Generates alphanumeric string.

```
options:

  length:Integer (default: 8)
    change the length of the generated string.

  unique:Boolean (default: false)
    Generates random alphanumeric string with set of non-rpeating characters.
    Max length is 62 unless `human: true` in which case max length is 57.

  human:Boolean (default: false)
    Generates human readable alphanumeric string.
    Characters `1, I, l, 0, O` are excluded from the random sample.

  additional_chars:Array (default: [])
    Define additional characters to add to the random sample.

```

##### AlphanumericRandom.human(options = {})

Same as setting the human option to true.

##### AlphanumericRandom.uniq(options = {})

Same as setting the unique option to true.
