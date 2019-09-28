# ValidationSkipper

(Forked from https://github.com/npearson72/validation_skipper)

This Rails gem lets you easily declare which attribute validations to skip in
you models, and choose when to skip them in your controllers.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'validation_skipper'
```

And then execute:

```bash
bundle
```

## Usage

### In your model

Let's say you have a User model with a name, phone, and password. In your code,
you might have validations like these:

```ruby
validates :name, :presence => true
validates :phone, :presence => true
validates :password, :presence => true
```

To implement `ValidationSkipper`, you would follow these simple steps.

#### Step 1: Include the `ValidationSkipper` module in the model

```ruby
include ValidationSkipper
```

#### Step 2: Declare which validations are allowed to be skipped

```ruby
can_skip_validation_for :name, :phone, :password
```

(Note: this does not automatically skip them, but makes them eligible for
skipping)

#### Step 3: Change the validations to look like these

```ruby
validates :name, :presence => true, :unless => Proc.new { |u| u.skip_name_validation? }
validates :phone, :presence => true, :unless => Proc.new { |u| u.skip_phone_validation? }
validates :password, :presence => true, :unless => Proc.new { |u| u.skip_password_validation? }
```

### In your controller

Now just pass the names of the fields you want to skip validation for from
within your controller, ex:

```ruby
def create
  @user = User.new(params[:user])
  @user.skip_validation_for :name, :phone
  # The rest of your code goes here...
end
```

This will now skip the validations for name and phone only, but still validate
for password.

And there you go, anytime you want the same effect elsewhere, just follow this
approach.

Enjoy!

## Contributing

1. Fork it (<https://github.com/K-and-R/validation_skipper/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Make your changes, *including passing tests*
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request (`hub pull-request -b K-and-R/validation_skipper:develop`)
