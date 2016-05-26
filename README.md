#StreetFleet

[![Build Status](https://travis-ci.org/westmd23/street_fleet.svg?branch=master)](https://travis-ci.org/westmd23/street_fleet)
[![Code Climate](https://codeclimate.com/github/westmd23/street_fleet/badges/gpa.svg)](https://codeclimate.com/github/westmd23/street_fleet)

This application exists to allow food truck proprietors to broadcast their
location to patrons. Mapping is provided by the `MapboxGLJS API` and
up-to-date geocoding is provided by the `Twitter API`

A version deployed to Heroku can be found [here.](http://streetfleet.herokuapp.com/)

##Contributions
StreetFleet is still in early stage development but will continue to grow
and Pull Requests are welcome.

##Dependencies
`"ruby", "~> 2.2"`
`"redis", "~> 2.2"`
`"pg", "~> 0.18.4"`

##Run
After pulling down the application run `bundle install`, `rake db:create`,
and migrate the database using `rake db:migrate`.

##Tests
All tests for this application are written in `Rspec` and can be run using
the `rspec` command from the project directory.

##Licensing
Apache License 2.0
