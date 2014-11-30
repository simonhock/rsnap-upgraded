Status
======

[![Build Status](https://travis-ci.org/snap-school/rsnap.png?branch=master)](https://travis-ci.org/snap-school/rsnap)
[![Dependency Status](https://gemnasium.com/snap-school/rsnap.png)](https://gemnasium.com/snap-school/rsnap)
[![Code Climate](https://codeclimate.com/github/snap-school/rsnap.png)](https://codeclimate.com/github/snap-school/rsnap)
[![Coverage Status](https://coveralls.io/repos/snap-school/rsnap/badge.png?branch=master)](https://coveralls.io/r/snap-school/rsnap?branch=master)
[Railsbp](http://railsbp.com/repositories/386-snap-school-rsnap)

Installation -- Linux only
============

* install [postgresql](http://www.postgresql.org/), 
	* Run postgresql ("sudo su - postgres")
	* Type "psql"
	* Type "CREATE ROLE rsnap SUPERUSER CREATEDB"
	* Type "\password rsnap"
	* Enter the admin password
	* Type "\q" to quit
	* Type "exit" to quit
	

* copy `config/database.yml.example` to `config/database.yml` 
	* configure `config/database.yml`. You should set usernames to "rsnap" and passwords to your choosen password.
	

* install and configure [rvm](https://rvm.io/) with ruby
	* Run "\curl -sSL https://get.rvm.io | bash -s stable" to install RVM,
	* Run "rvm install 2.1.1" to install ruby 2.1.1
	* Run "rvm install rubygems latest" to install rubygems
	* Run "gem install rails -v '4.1' " to install rails 4.1
	
* Make sure you have qmake installed.
	* To do so, run "which qmake"
	* If you don't have it, install QT:
		*Run "sudo apt-get install libqt4-dev libqtwebkit-dev libqt5webkit5-dev"

* run `bundle intall` and install all dependencies needed for the gems

* run `rake bower:install`

* copy `.env.example` to `.env` and configure them if needed. 

* run `rake db:create db:migrate`
	* This will create the database.

* run `rails s` to launch server
	* Create an account. This will be your admin account.

* run `rails c` and execute `User.all.first.add_role :admin` then 'exit'.
	* This will set the first user to admin. This should be the admin account if you did not created another account first.
