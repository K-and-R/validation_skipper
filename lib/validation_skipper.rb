require "active_record"

module ValidationSkipper

  extend ActiveSupport::Concern

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
ActiveRecord::Base.send(:include, ValidationSkipper)
