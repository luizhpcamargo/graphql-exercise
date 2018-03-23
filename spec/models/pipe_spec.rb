require 'rails_helper'

RSpec.describe Pipe, type: :model do
  it { is_expected.to belong_to :organization }
  it { is_expected.to have_many :phases }
  it { is_expected.to validate_uniqueness_of :ext_id }

  context '#build_from' do
    let(:obj){ double(name: 'Pipe', id: 1, phases: []) }
    let(:pipe){ Pipe.build_from(obj) }

    it{ expect(pipe).to be_a Pipe }
    it{ expect(pipe.name).to eq obj.name }
    it{ expect(pipe.ext_id).to eq obj.id }
    it{ expect(pipe.phases.size).to be_zero }
  end
  context '#fields_title' do
    let(:pipe){ FactoryBot.create(:pipe, phases: [FactoryBot.build(:phase, cards: FactoryBot.build_list(:card, 5))])}

    it{ expect(pipe.fields_title).to eq pipe.cards.map(&:fields_title).flatten }
  end
end

