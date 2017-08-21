# Surveyor - Culture Amp Junior Engineering Coding Test

Hi! Thanks for applying for the Junior Engineering Program at Culture Amp.

What you'll find in this little directory is some code that was generated using the `bundle gem` command from the Bundler gem. This code is the code for an (imaginary) gem called "surveyor", which helps represent survey data within Ruby.

The two main sub-directories we would like to highlight are `spec` and `lib`.

The `spec` directory contains some [RSpec](http://rspec.info/) tests. It is your job to make as many of these tests pass as you can. **You do not have to make all the tests pass to submit this coding test back to Culture Amp.**

You will be assessed based on how you make the tests pass. What we're looking for in particular is:

* Strong adherence to the [ruby-style-guide](https://github.com/bbatsov/ruby-style-guide)
* Clean & simple Ruby code to make the tests pass
* Code that will still work if we were to change the tests requirements slightly

## Layout

The test files are numbered from `00` to `06`. These numbers can be thought of as a grade, but don't take them too seriously.

Tests `00` and `01` contain code within the tests files themselves. This is to make it easier for you to navigate between the code and the tests. You don't necessarily have to only write code within the methods we provided. Think of these methods more as guidelines than solid boundaries.

Tests from `02` to `06` expect the code to be within the `lib` directory. There are some placeholder classes in the `lib` directory already to get you started.

## Setup

To run these tests, you will need a modern version of Ruby installed (2.3 or greater is preferred). You will also need Bundler installed:

```
gem install bundler
```

Once you have Ruby + Bundler installed, you can install the gem dependencies for this test with this command:

```
bundle install
```

Then you can start running the tests:

```
bundle exec rspec
```

Only one test will run at the beginning. This is intentional, and is meant to keep you focussed on fixing just one broken test at a time.

If you want to check your syntax, run this command:

```
bundle exec rubocop
```

## Making the tests pass

As stated before, your goal is to make as many of the tests pass as possible. You should pay attention to the error messages closely in the test and try to interpret what they're asking for. Try to focus on one test at a time and making that pass.

## Submitting the coding test

If you think you've finished with the coding test, then please do submit it back to us by following the instructions in the email. We'll evalulate it and get back to you.

Good luck!

