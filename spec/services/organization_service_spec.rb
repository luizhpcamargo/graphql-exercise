require 'rails_helper'

RSpec.describe OrganizationService, type: :service do

  context 'request' do
    let(:url) { 'https://app.pipefy.com/queries' }
    let(:file) { File.read('spec/example/organization.json') }
    let(:service) { OrganizationService.new}

    context 'initialize' do
      it { expect(service.organization_id).to eq Rails.application.secrets.organization_id }
      it do
        service = OrganizationService.new(123)
        expect(service.organization_id).to eq 123
      end
    end

    context 'success' do
      before do
        stub_request(:post, url).to_return(body: file)
      end

      it do
        expect { OrganizationService.fetch }.
          to change{ Organization.count }.by(1).
          and change{ Card.count }.by(4).
          and change{ Field.count }.by(15).
          and change{ Field.cards.count }.by(10).
          and change{ Field.phases.count }.by(5).
          and change{ Label.count }.by(2).
          and change{ Phase.count }.by(6).
          and change{ Pipe.count }.by(1)
      end
    end

    context 'no organization result' do
     before do
       body = JSON.parse(file)
       body["data"].delete("organization")
       stub_request(:post, url).to_return(body: body.to_json)
     end

     it { expect(OrganizationService.fetch).to be_nil }
   end

   context 'server error' do
     before do
      stub_request(:post, url).to_return(status: 500)
     end

     it { expect(OrganizationService.fetch).to be_a(Hash) }
     it { expect(OrganizationService.fetch).to eq({error: "the server responded with status 500"}) }
   end
 end
end
