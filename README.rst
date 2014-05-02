.. role:: ruby(code)
    :language: ruby

.. role:: sh(code)
    :language: sh

asrt
==========

.. image:: https://travis-ci.org/ct-clearhaus/asrt.png?branch=master
    :alt: Build Status
    :target: https://travis-ci.org/ct-clearhaus/asrt

.. image:: https://codeclimate.com/github/ct-clearhaus/asrt.png
    :alt: Code Climate
    :target: https://codeclimate.com/github/ct-clearhaus/asrt

.. image:: https://coveralls.io/repos/ct-clearhaus/asrt/badge.png?branch=master
    :alt: Coveralls
    :target: https://coveralls.io/r/ct-clearhaus/asrt

.. image:: http://img.shields.io/license/MIT.png?color=green
    :alt: MIT License
    :target: http://opensource.org/licenses/MIT

Introduction
------------

`This gem <https://rubygems.org/gems/asrt>`_ simply gives you :ruby:`asrt` so
you can do assertions like this:

.. code-block:: ruby

    def funny(input)
      asrt input.is_a?(String), 'Me only eat strings.'

      input.strip + ' is funny'
    end

Why use :ruby:`asrt` rather than :ruby:`assert`? Well, it's short and you may
like to use some other assert stuff for your unit tests.


Installation
------------

.. code-block:: sh

    gem install asrt

In your ``Gemfile`` may want to have :ruby:`gem 'asrt'`.

Dependencies
............

None.


Contribute
----------

* `Fork <https://github.com/ct-clearhaus/asrt/fork>`_
* Clone
* :sh:`bundle install && bundle exec rake test`
* Make your changes
* :sh:`bundle exec rake test` again, preferably against Ruby 1.9.3, 2.0.0 and
  2.1.0 (`Travis <https://travis-ci.org/ct-clearhaus/asrt/pull_requests>`_
  will do that).
* Create a Pull Request
* Enjoy!
