sdbm-dump
=========

Ruby script to convert Schoenberg Data of Manuscript CSV dump to Sqlite3
database.

The full database dump can be found here:
<http://www.library.upenn.edu/data/schoenberg/schoenbergAll.zip> (19+ MB).

This script reads in the SDBM dump file and writes it to an SQLite3 database:

      data/sdbm_dump.sqlite3

# Requirements

- Ruby v2.0.x or higher

If you don't have Ruby v2.0.x on your system, it is recommended you use rbenv
to install it. On Mac you can use Homebrew to install rbenv.

- Homebrew <http://brew.sh>
- rbenv <https://github.com/sstephenson/rbenv>

Gems: 

- bundler (to install gems, recommended)
- ActiveRecord
- sqlite3

# Install

When you have Ruby v2.0.x installed, make sure you have `bundler` installed.

     $ gem install bundler

Clone the repo and user bundler to isntall the gems:

     $ git clone git@github.com:demery/sdbm-dump.git
     $ cd sdbm-dump
     $ bundle #install gems in Gemfile


Test the script, using bundler:

      $ bundle exec bin/convert_csv.rb data/schoenbergTest.csv

Or without bundler:

      $ ./bin/convert_csv.rb data/schoenbergTest.csv

# Load the database

Download and unzip the database:
<http://www.library.upenn.edu/data/schoenberg/schoenbergAll.zip>

Run the conversion script to create the database.

      $ bundle exec bin/convert_csv.rb path/to/schoenbergAll.csv

or

      $ ./bin/convert_csv.rb path/to/schoenbergAll.csv

Any older database file will be deleted and a new database file created each
time:

      data/sdbm-dump.sqlite3
