require 'rubygems'
require 'rspec'
require 'active_model'

I18n.enforce_available_locales = false

require 'simplecov'
SimpleCov.start 'rails' do
  # Ignore the version file
  add_filter 'lib/validation_skipper/version.rb'
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'validation_skipper'

class TestUser
  include ActiveModel::Validations
  include ValidationSkipper

  attr_accessor *%i[name email password]

  validates_presence_of :name
  can_skip_validation_for *%i[email password]
  validates_presence_of(
    :email,
    unless: Proc.new { |u| u.skip_email_validation? }
  )
  validates_presence_of(
    :password,
    unless: Proc.new { |u| u.skip_password_validation? }
  )

  def initialize(attributes = {})
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end
end
