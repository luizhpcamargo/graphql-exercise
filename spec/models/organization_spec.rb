require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :ext_id }

  context '#create_from' do
    let(:obj) { double(name: 'Org', id: 1, pipes: [])}
    let(:organization) { Organization.create_from(obj, obj.id) }

    it{ expect(organization).to be_a Organization }
    it{ expect(organization.name).to eq obj.name }
    it{ expect(organization.ext_id).to eq obj.id }
    it{ expect(organization.pipes.size).to be_zero }
  end
end
