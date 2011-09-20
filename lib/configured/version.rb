module Configured # :nodoc:
  module Version # :nodoc:
    MAJOR = 1
    MINOR = 0
    TINY = 2
    PRE = nil

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')

    SUMMARY = "configured #{STRING}"
  end
end
