require 'spec_helper'

describe Transifex::Error do
  let(:client) { Transifex::Client.new }

  {
    401 => Transifex::Unauthorized,
    403 => Transifex::Forbidden,
    404 => Transifex::NotFound,
    406 => Transifex::NotAcceptable,
    409 => Transifex::Conflict,
    415 => Transifex::UnsupportedMediaType,
    422 => Transifex::UnprocessableEntity,
  }.each do |status, exception|
    context "when HTTP response status is #{status}" do
      before do
        stub_get('/project/xyz/').to_return(status: status)
      end

      it "should raise #{exception.name} error" do
        expect {
          client.project('xyz')
        }.to raise_error(exception) { |e|
          e.should be_a_kind_of(Transifex::Error)
          e.should respond_to(:response)
        }
      end
    end
  end
end
