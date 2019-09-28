require 'active_record'

# ValidationSkipper module/concern
# Provides functionality to skip validations for a set of attributes
# Directly contains Instance methods
module ValidationSkipper
  extend ActiveSupport::Concern

  # Class methods
  module ClassMethods
    def can_skip_validation_for(*args)
      args.each do |attr|
        send(:attr_accessor, "skip_#{attr}_validation")
        send(:define_method, "skip_#{attr}_validation?") { send("skip_#{attr}_validation") }
      end
    end
  end

  def skip_validation_for(*args)
    args.each { |attr| send("skip_#{attr}_validation=", true) }
  end
end
