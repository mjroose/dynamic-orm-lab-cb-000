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
    options.each do |prop, value|
      self.send("#{prop}=", value)
    end
  end

  def table_name_for_insert
    self.class.table_name
  end

  def col_names_for_insert
    col_names = self.class.column_names
    col_names.delete_if {|col_name| col_name == "id"}.join(", ")
  end
end
