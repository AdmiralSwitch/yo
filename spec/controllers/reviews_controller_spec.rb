require 'spec_helper'

describe ReviewsController do
  render_views
  describe "index" do
    before do
      Review.create!(name: 'Bob')
      Review.create!(name: 'Tim')
      Review.create!(name: 'Gavin')
      Review.create!(name: 'Jon')

      xhr :get, :index, format: :json, keywords: keywords
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_name
      ->(object) { object["name"] }
    end

    context "when the search finds results" do
      let(:keywords) { 'baked' }
      it 'should 200' do
        expect(response.status).to eq(200)
      end
      it 'should return two results' do
        expect(results.size).to eq(2)
      end
      it "should include 'Bob'" do
        expect(results.map(&extract_name)).to include('Bob')
      end
      it "should include 'Jon'" do
        expect(results.map(&extract_name)).to include('Jon')
      end
    end

    context "when the search doesn't find results" do
      let(:keywords) { 'foo' }
      it 'should return no results' do
        expect(results.size).to eq(0)
      end
    end

  end
end