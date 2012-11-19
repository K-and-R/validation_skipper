# ValidationSkipper

This Rails gem lets you easily declare which attribute validations to skip in you models, and choose when to skip them in your controllers.

## Installation

Add this line to your application's Gemfile:

    gem 'validation_skipper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validation_skipper

## Usage

### In your model:

Let's say you have a User model with a name, phone, and password.

##### In your code, you might have validations like these:

    validates :name, :presence => true
    validates :phone, :presence => true
    validates :password, :presence => true

##### Step 1: Declare which validations are allowed to be skipped:

    can_skip_validation_for :name, :phone, :password

(Note: this does not automatically skip them, but makes them eligible for skipping)


##### Step 2: Change the validations to look like these:

    validates :name, :presence => true, :unless => skip_name_validation?
    validates :phone, :presence => true, :unless => skip_phone_validation?
    validates :password, :presence => true, :unless => skip_pasword_validation?

### In your controller:

Now just pass the names of the fields you want to skip validation for from within your controller, ex:

    def create
      @user = User.new(params[:user])
      @user.skip_validation_for :name, :phone
      # The rest of your code goes here...
    end

This will now skip the validations for name and phone only, but still validate for password.

And there you go, anytime you want the same effect elsewhere, just follow this approach.

Enjoy!


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request