require 'rails_helper'

RSpec.describe Field, type: :model do
  it { is_expected.to belong_to :object }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :object }
  it { is_expected.to validate_presence_of :content }

  context 'with scopes'  do
    before do
      FactoryBot.create_list(:field, 7,object: FactoryBot.create(:card))
      FactoryBot.create_list(:field, 9,object: FactoryBot.create(:phase))
    end

    it { expect(Field.count).to be 16 }
    it { expect(Field.cards.count).to be 7 }
    it { expect(Field.phases.count).to be 9 }
  end

end
