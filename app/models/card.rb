class Card < ApplicationRecord
  belongs_to :phase
  has_many :fields, as: :object, dependent: :destroy
  has_and_belongs_to_many :labels
  accepts_nested_attributes_for :fields, :labels
  validates_uniqueness_of :ext_id


  def self.build_from(obj)
    return if obj.blank?
    card = Card.create_with({name: obj.title}).find_or_initialize_by(ext_id: obj.id)

    card.due_date = obj.due_date
    card.created_at = obj.created_at

    obj.fields.each do |field|
      card.fields << Field.create_with(content: field.value).find_or_initialize_by(object: card, name: field.name)
    end
    obj.labels.each do |label|
      card.labels << Label.create_with({name: label.name}).find_or_create_by(ext_id: label.id)
    end
    card
  end

  def fields_title
    fields.map(&:name).sort
  end

  def field_by_name(name)
    fields.find_by(name: name)
  end
end
