require 'rubygems'
require 'bundler/setup'
require 'active_record'
require 'active_support/concern'

module AssociationCallbacks
  
  class << self
    
    def version
      @@version ||= File.read(File.expand_path(File.dirname(__FILE__) + '/../VERSION')).strip.freeze
    end
    
  end
  
end

lib_path = File.expand_path(File.dirname(__FILE__) + '/association_callbacks')

require "#{lib_path}/active_record"

ActiveRecord::Base.send(:include, AssociationCallbacks::ActiveRecord)