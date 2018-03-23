require 'rails_helper'

RSpec.describe Card, type: :model do
  it { is_expected.to belong_to :phase }
  it { is_expected.to have_many :fields }
  it { is_expected.to have_and_belong_to_many :labels }
  it { is_expected.to validate_uniqueness_of :ext_id }

end
