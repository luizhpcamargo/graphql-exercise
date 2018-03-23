require 'rails_helper'

RSpec.describe Phase, type: :model do
  it { is_expected.to belong_to :pipe }
  it { is_expected.to have_many :fields }
  it { is_expected.to have_many :cards }
  it { is_expected.to validate_uniqueness_of :ext_id }

  context '#build_from' do
    let(:obj){ double(name: 'Phase', id: 1, cards: double(edges: []), fields: [double(label: 'Field 1', id: '1')]) }
    let(:phase){ Phase.build_from(obj) }

    it{ expect(phase).to be_a Phase }
    it{ expect(phase.name).to eq obj.name }
    it{ expect(phase.ext_id).to eq obj.id }
    it{ expect(phase.cards.size).to be_zero }
    it{ expect(phase.fields.size).to eq 1 }
    it{ expect(phase.fields.first.name).to eq '1' }
    it{ expect(phase.fields.first.content).to eq 'Field 1' }
  end
end
