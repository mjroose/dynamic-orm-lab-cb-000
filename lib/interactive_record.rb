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
  end

  def initialize(options={})
    binding.pry
    options.each do |prop, value|
      if self[prop.to_sym] != nil
        self.send("#{prop}=", value)
      end
    end
  end
end
