require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    table_info = DB[:conn].execute("pragma table_info(#{table_name});")

    column_names = table_info.collect do |column|
      column["name"]
    end.compact
    binding.pry
  end
end
