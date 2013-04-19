require 'spec_helper'

describe Transifex::Request do
  describe '#connection' do
    subject { Transifex::Request.connection }

    it 'returns a connection object' do
      should_not be_nil
    end
  end
end
