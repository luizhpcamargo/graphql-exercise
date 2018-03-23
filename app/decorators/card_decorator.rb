class CardDecorator < Draper::Decorator
  delegate :name, :created_at, :due_date, :field_by_name, :phase, :labels
  delegate :name, to: :phase, prefix: true

  def created_at
    I18n.l(object.created_at) if object.created_at.present?
  end

  def due_date
    I18n.l(object.due_date) if object.due_date.present?
  end

  def field_by_name(field_name)
    field = object.field_by_name(field_name)
    return if field.blank?
    return JSON.parse(field.content).to_sentence if field.content.match(/\[|\]/)
    field.content
  end

  def labels
    object.labels.distinct.map(&:name).to_sentence
  end
end
