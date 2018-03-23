require 'rails_helper'

RSpec.describe Card, type: :model do
  it { is_expected.to belong_to :phase }
  it { is_expected.to have_many :fields }
  it { is_expected.to have_and_belong_to_many :labels }
  it { is_expected.to validate_uniqueness_of :ext_id }

  context '#build_from' do
    let(:due_date) { 1.day.since }
    let(:created_at) { 1.day.ago }
    let(:obj) { double(title: 'Test', due_date: due_date, created_at: created_at, id: '1', fields: [], labels: [ double(name: 'Label', id: '1')]) }
    let(:obj2) { double(title: 'Test 2', id: '2', due_date: 2.day.since, created_at: 2.day.ago, fields: [], labels: [ double(name: 'Label', id: '1')]) }
    let(:card) { Card.build_from(obj) }
    let(:card2) { Card.build_from(obj2) }

    it { expect(card).to be_a Card }
    it { expect(card.name).to eq obj.title }
    it { expect(card.ext_id).to eq obj.id.to_i }
    it { expect(card.due_date).to eq due_date }
    it { expect(card.created_at).to eq created_at }
    it { expect(card.fields.size).to be_zero }
    it { expect(card.labels.size).to eq 1 }
    it { expect(card.labels.first.name).to eq 'Label' }
    it { expect(card.labels.first.ext_id).to eq 1 }
    it { expect(card.labels.first).to eq card2.labels.first }
  end

  context 'fields methods' do
    let(:card) { FactoryBot.create(:card, fields: FactoryBot.build_list(:field, 4)) }
    let(:fields) { card.fields }

    context '#fields_title' do
      it { expect(card.fields_title).to eq fields.collect(&:name).sort }
    end

    context '#field_by_name' do
      it { expect(card.field_by_name(fields.first.name)).to eq fields.first }
    end
  end
end
