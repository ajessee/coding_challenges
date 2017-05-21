require ::File.expand_path('../../config/environment',  __FILE__)
require "spec_helper"

describe "Ricky Rack Middleware" do

  let(:application) { RickyApp.new }
  let(:rickymiddleware) { RickyRackMiddleware.new(application) }
  let(:rickyquotes) { RickyQuoteParser.new.quotes }
  let(:mockrequest) { Rack::MockRequest.new(rickymiddleware) }

  describe "GET '/quote' is requested" do

    let(:mockresponse) { mockrequest.get('/quote')}

     it 'should return 200 status' do
      expect(mockresponse.status).to eq(200)
    end

    it 'should return a response in a text/plain format' do
      expect(mockresponse.header["Content-Type"]).to eq("text/plain")
    end

    it 'should return a random quote from the collection' do
      expect(rickyquotes).to include(mockresponse.body)
    end

  end

  describe "POST '/quote' is requested" do

    let(:mockresponse) { mockrequest.post('/quote')}

     it 'should return 404 status' do
      expect(mockresponse.status).to eq(404)
    end

    it 'should return a response in a text/plain format' do
      expect(mockresponse.header["Content-Type"]).to eq("text/plain")
    end

    it 'should return an error message' do
      expect(mockresponse.body).to eq("Sorry mate, that's a bad request (404). Try the '/quote' path.")
    end

  end

end
