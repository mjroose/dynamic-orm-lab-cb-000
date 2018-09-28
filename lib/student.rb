require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'

class Student < InteractiveRecord
  col_names = self.column_names
  if col_names
    col_names.each do |col_name|
      self.send(attr_accessor, col_name.to_sym)
    end
  end
end
