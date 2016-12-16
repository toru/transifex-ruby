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
      subject.each {|p| expect(p).to be_a Transifex::Project }
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

    describe '#resources' do
      subject { client.project(slug).resources }

      before do
        stub_get("/project/#{slug}/resources/").to_return(
          body: fixture('resources.json'),
          headers: BASE_HEADERS
        )
      end

      it 'returns an array of Resource objects' do
        subject.each {|p| expect(p).to be_a Transifex::Resource }
      end
    end

    describe '#resource' do
      let(:resource_slug) { 'core' }
      subject { client.project(slug).resource(resource_slug) }

      before do
        stub_get("/project/#{slug}/resource/#{resource_slug}").to_return(
          body: fixture('resource.json'),
          headers: BASE_HEADERS
        )
      end

      it 'returns an Resource object' do
        expect(subject).to be_a Transifex::Resource
      end

      describe '#stats' do
        let(:resource_slug) { 'core' }
        let(:lang) { 'en' }
        subject { client.project(slug).resource(resource_slug).stats(lang) }

        before do
          stub_get("/project/#{slug}/resource/#{resource_slug}/stats/#{lang}").to_return(
            body: fixture('stats.json'),
            headers: BASE_HEADERS
          )
        end

        it 'returns an Stats object' do
          expect(subject).to be_a Transifex::Stats
        end
      end
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
        subject.each {|p| expect(p).to be_a Transifex::Language }
      end
    end

  end
end
