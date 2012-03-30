require 'rubygems'
require 'bundler/setup'

module AssociationCallbacks
  
  class << self
    
    def version
      @@version ||= File.read(File.expand_path(File.dirname(__FILE__) + '/../VERSION')).strip.freeze
    end
    
  end
  
end