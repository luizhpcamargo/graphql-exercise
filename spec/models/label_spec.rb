require 'rails_helper'

RSpec.describe Label, type: :model do
  it { is_expected.to validate_uniqueness_of :ext_id }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :ext_id }
end
