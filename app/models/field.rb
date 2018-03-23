class Field < ApplicationRecord
  belongs_to :object, polymorphic: true

  validates_presence_of :name, :object
  validates_presence_of :content

  scope :cards, -> { where(object_type: 'Card') }
  scope :phases, -> { where(object_type: 'Phase') }

  def to_s
    return JSON.parse(content).to_sentence if content.match(/\[|\]/)
    content
  end
end
