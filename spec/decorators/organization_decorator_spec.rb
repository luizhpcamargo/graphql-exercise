require 'rails_helper'

RSpec.describe OrganizationDecorator do
  let(:organization) { FactoryBot.create(:organization)}
  let(:organization_decorated) { organization.decorate }

  it { expect(organization_decorated).to respond_to :name }
  it { expect(organization_decorated).to respond_to :pipes }
  it { expect(organization_decorated.pipes&.decorator_class).to be PipeDecorator }
end
