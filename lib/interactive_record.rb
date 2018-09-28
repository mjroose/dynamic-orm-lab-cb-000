require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pluralize'

class InteractiveRecord
  def self.table_name
    self.to_s.downcase.pluralize
  end
end
