# LabReservation

Gem written as a class assignment.  Maintains a list of users, machines, and reservation requests.

## Installation

Add this line to your application's Gemfile:

    gem 'tsolak_test_gem'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tsolak_test_gem

## Features/Problems

Features
* maintains list of users
  * add
  * delete
  * update last name
* maintains list of machines
* maintains list of reservations

Problems
* no web interface
* does not currently support email
* uses txt files not a database -- for small labs only
* uses "|" delimited text files and does not check for "|" in input

## Contributing

1. Fork it
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Added some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create new Pull Request

## LICENSE

The MIT License (MIT)

Copyright (c) 2013 t solak 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

