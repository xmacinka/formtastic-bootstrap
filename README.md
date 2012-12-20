# Fork

This is a fork of [mjbellantoni/formtastic-bootstrap](https://github.com/mjbellantoni/formtastic-bootstrap) with some changes:

* Merged [mjbellantoni/formtastic-bootstrap/pull/43](https://github.com/mjbellantoni/formtastic-bootstrap/pull/43) by [jisk](https://github.com/jisk/formtastic-bootstrap): Move help-inline error sentences inside their control's div
* Merged [mjbellantoni/formtastic-bootstrap/pull/44](https://github.com/mjbellantoni/formtastic-bootstrap/pull/44) by [thejbsmith](https://github.com/thejbsmith/formtastic-bootstrap): Adding Appended and Prepended Text
* Merged [mjbellantoni/formtastic-bootstrap/pull/46](https://github.com/mjbellantoni/formtastic-bootstrap/pull/46) by [cluesque](https://github.com/cluesque/formtastic-bootstrap): Only label a checkbox once

This also solves issues [42](https://github.com/mjbellantoni/formtastic-bootstrap/issues/42) and [45](https://github.com/mjbellantoni/formtastic-bootstrap/issues/45). Specs seem to be broken when I started this fork and will be fixed in a future commit.

# Formtastic Bootstrap

A [Formtastic](https://github.com/justinfrench/formtastic) form builder that creates markup suitable for the [Twitter Bootstrap](http://twitter.github.com/bootstrap/) framework.  In theory, it should just work.  Two great tastes in one!

#### Installation

Install the gem with 

    gem install formtastic-bootstrap

Or add it to your Gemfile:

    gem 'formtastic-bootstrap'

And install it with <tt>bundle install</tt>.

#### Configuration

Add the following line to your Formtastic initialization file:

    # config/initializers/formtastic.rb
    Formtastic::Helpers::FormHelper.builder = FormtasticBootstrap::FormBuilder

Add the following line to the top of your <tt>application.css</tt> file:

    # app/assets/stylesheets/application.css
    *= require formtastic-bootstrap

Make sure you've already downloaded and installed Formtastic!
