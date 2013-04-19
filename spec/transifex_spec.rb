require 'spec_helper'

describe Transifex do
  describe '#configure' do
    let(:username) { 'nadia' }
    let(:password) { 'candy' }

    before do
      Transifex.configure do |config|
        config.username = username
        config.password = password
      end
    end

    it 'stores the username' do
      expect(Transifex.username).to eql username
    end

    it 'stores the password' do
      expect(Transifex.password).to eql password 
    end
  end
end
