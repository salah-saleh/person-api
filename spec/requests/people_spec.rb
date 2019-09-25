# spec/requests/people_spec.rb
require 'rails_helper'

RSpec.describe 'People API', type: :request do
  # initialize test data 
  # let!(:people) { create_list(:person, 10) }
  let!(:people) { 10.times.map { |i| Person.create!(name: "potluck", hobbies: "football bla", birthday: "Oct 30th 2017") } }
  let(:person_id) { people.first.id }

  # Test suite for GET /people
  describe 'GET /people' do
    # make HTTP get request before each example
    before { get '/people' }

    it 'returns people' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
