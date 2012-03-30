require 'spec_helper'

describe AssociationCallbacks do

  describe '.version' do
    
    it 'is a string' do
      AssociationCallbacks.version.should be_a(String)
    end
    
    it 'is with correct format' do
      AssociationCallbacks.version.should match(/^\d+\.\d+(\.\d+)?$/)
    end
    
    it 'is freezed' do
      expect {
        AssociationCallbacks.version.gsub!('.', '#')
      }.to raise_error(/can't modify frozen string/i)
    end
    
  end

end
