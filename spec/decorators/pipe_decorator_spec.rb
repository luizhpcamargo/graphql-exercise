require 'rails_helper'

RSpec.describe PipeDecorator do
  let(:pipe) { FactoryBot.create(:pipe)}
  let(:pipe_decorated) { pipe.decorate }

  it { expect(pipe_decorated).to respond_to :name }
  it { expect(pipe_decorated).to respond_to :cards }
  it { expect(pipe_decorated).to respond_to :fields_title }
  it { expect(pipe_decorated.cards&.decorator_class).to be CardDecorator }
end
