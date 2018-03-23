require 'rails_helper'

RSpec.describe CardDecorator do
  let(:card) { FactoryBot.create(:card)}
  let(:card_decorated) { card.decorate }

  it { expect(card_decorated).to respond_to :phase }
  it { expect(card_decorated).to respond_to :name }
  it { expect(card_decorated).to respond_to :created_at }
  it { expect(card_decorated).to respond_to :due_date }
  it { expect(card_decorated).to respond_to :field_by_name }
  it { expect(card_decorated).to respond_to :phase_name }
  it { expect(card_decorated).to respond_to :labels }
  it { expect(card_decorated.due_date).to eq card.due_date.strftime("%d/%m/%Y") }
  it { expect(card_decorated.created_at).to eq card.created_at.strftime("%d/%m/%Y") }
end
