sdbm-dump
=========

Ruby script to convert Schoenberg Data of Manuscript CSV dump to Sqlite3
database.

The full database dump can be found here:
<http://www.library.upenn.edu/data/schoenberg/schoenbergAll.zip> (19+ MB).

This script reads in the SDBM dump file and writes it to an SQLite3 database:

      data/sdbm_dump.sqlite3

All records are added to the table `observations`.

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

Clone the repo and use bundler to install the gems:

     $ git clone git@github.com:demery/sdbm-dump.git
     $ cd sdbm-dump
     $ bundle #install gems in Gemfile


Test the script, using bundler:

      $ bundle exec bin/convert_csv.rb data/schoenbergTest.csv
      -- create_table(:observations)
         -> 0.0060s
      Created database: /Users/emeryr/code/GIT/sdbm-dump/db/sdbm_dump.sqlite3
            0 of c. 9999 added -- 2014-02-13 13:45:19 -0500
         1000 of c. 9999 added -- 2014-02-13 13:45:22 -0500
         2000 of c. 9999 added -- 2014-02-13 13:45:26 -0500
         3000 of c. 9999 added -- 2014-02-13 13:45:30 -0500
         4000 of c. 9999 added -- 2014-02-13 13:45:33 -0500
         5000 of c. 9999 added -- 2014-02-13 13:45:37 -0500
         6000 of c. 9999 added -- 2014-02-13 13:45:41 -0500
         7000 of c. 9999 added -- 2014-02-13 13:45:45 -0500
         8000 of c. 9999 added -- 2014-02-13 13:45:48 -0500
         9000 of c. 9999 added -- 2014-02-13 13:45:52 -0500
         9898 of    9898 added -- 2014-02-13 13:45:56 -0500

Or without bundler:

      $ ./bin/convert_csv.rb data/schoenbergTest.csv
      ...

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

All records are added to the table `observations`.