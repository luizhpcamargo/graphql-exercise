class PipeDecorator < Draper::Decorator
  delegate :name, :cards, :fields_title

  decorates_association :cards, with: CardDecorator

end
