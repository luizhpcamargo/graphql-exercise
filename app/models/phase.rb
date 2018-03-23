class Phase < ApplicationRecord
  belongs_to :pipe
  has_many :fields, as: :object, dependent: :destroy
  has_many :cards, dependent: :destroy

  accepts_nested_attributes_for :fields, :cards

  validates_uniqueness_of :ext_id

  def self.build_from(obj)
    return if obj.blank?

    phase = Phase.create_with(name: obj.name).find_or_initialize_by(ext_id: obj.id)

    obj.cards.edges.each do |card|
      phase.cards << Card.build_from(card.node)
    end
    obj.fields.each do |field|
      phase.fields << Field.create_with(content: field.label).find_or_initialize_by(object: phase, name: field.id)
    end
    phase
  end
end
