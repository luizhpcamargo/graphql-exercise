class OrganizationDecorator < Draper::Decorator
  delegate :name, :pipes

  decorates_association :pipes, with: PipeDecorator
end
