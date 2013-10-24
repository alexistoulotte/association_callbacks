require 'rubygems'
require 'bundler/setup'
require 'active_record'
require 'active_support/concern'

module AssociationCallbacks

  def self.version
    @@version ||= File.read(File.expand_path("#{__dir__}/../VERSION")).strip.freeze
  end

end

lib_path = "#{__dir__}/association_callbacks"

require "#{lib_path}/active_record"

ActiveRecord::Base.send(:include, AssociationCallbacks::ActiveRecord)
