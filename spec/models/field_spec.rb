require 'rails_helper'

RSpec.describe Field, type: :model do
  it { is_expected.to belong_to :object }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :object }
  it { is_expected.to validate_presence_of :content }
end
