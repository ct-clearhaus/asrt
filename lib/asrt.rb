module Asrt
  class AssertionError < StandardError
  end

  module Fallible
    def asrt(*args, &block)
      if block.nil?
        condition, message, garbage = args

        okay = (condition == true)
      else
        message, garbage = args

        okay = (yield rescue false) == true
      end

      raise ArgumentError, 'wrong number of arguments.' unless garbage.nil?

      raise AssertionError, message unless okay
    end
  end

  module Infallible
    def asrt(*args, &block)
      if block.nil?
        _, _, garbage = args
      else
        _, garbage = args
      end

      raise ArgumentError, 'wrong number of arguments.' unless garbage.nil?
    end
  end

  def self.disable
    Object.class_eval do
      include Asrt::Infallible
    end
  end
end

Object.class_eval do
  include Asrt::Fallible
end
