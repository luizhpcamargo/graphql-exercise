class Field < ApplicationRecord
  belongs_to :object, polymorphic: true

  validates_presence_of :name, :object
  validates_presence_of :content

  scope :cards, -> { where(object_type: 'Card') }
  scope :phases, -> { where(object_type: 'Phase') }
end
