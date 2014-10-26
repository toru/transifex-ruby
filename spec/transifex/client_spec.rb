require 'spec_helper'

describe Transifex::Client do
  let(:client) { Transifex::Client.new }

  describe '#projects' do
    subject { client.projects }

    before do
      stub_get('/projects/').to_return(
        body: fixture('projects.json'),
        headers: BASE_HEADERS
      )
    end

    it 'returns an array of Project objects' do
      subject.each {|p| p.should be_a Transifex::Project }
    end
  end

  describe '#project' do
    let(:slug) { 'transifex' }
    subject { client.project(slug) }

    before do
      stub_get("/project/#{slug}/").to_return(
        body: fixture('project.json'),
        headers: BASE_HEADERS
      )
    end

    it 'returns a Project object' do
      should be_a Transifex::Project
    end

    describe '#languages' do
      subject { client.project(slug).languages }

      before do
        stub_get("/project/#{slug}/languages/").to_return(
          body: fixture('languages.json'),
          headers: BASE_HEADERS
        )
      end

      it 'returns an array of Language objects' do
        subject.each {|p| p.should be_a Transifex::Language }
      end
    end

  end
end
