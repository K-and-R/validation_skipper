require "validation_skipper/version"

module ValidationSkipper  # Creates "attr_accessor" methods and related boolean checker method.
  
  extend ActiveSupport::Concern

  module ClassMethods
    def can_skip_validation_for(*args)
      args.each do |attr|
        send(:attr_accessor, "skip_#{attr}_validation")
        send(:define_method, "skip_#{attr}_validation?") { send("skip_#{attr}_validation") }
      end
    end
  end

  # Hook to include ClassMethods as... class methods.
  def self.included(base)
    base.extend ClassMethods
  end

  # Defines a "skip_validation_for" method to use in controllers.
  def skip_validation_for(*args)
    args.each { |attr| send("skip_#{attr}_validation=", true) }
  end
end

# include the extension 
ActiveRecord::Base.send(:include, ValidationSkipper)