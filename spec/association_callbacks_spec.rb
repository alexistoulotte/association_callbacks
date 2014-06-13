require 'spec_helper'

describe AssociationCallbacks do

  describe '.version' do

    subject { AssociationCallbacks.version }

    it { should be_a(String) }
    it { should match(/^\d+\.\d+(\.\d+)?$/) }

    it 'is freezed' do
      expect {
        subject.gsub!('.', '#')
      }.to raise_error(/can't modify frozen string/i)
    end

  end

end
