class Pipe < ApplicationRecord
  belongs_to :organization
  has_many :phases, dependent: :destroy
  has_many :cards, through: :phases

  accepts_nested_attributes_for :phases

  validates_uniqueness_of :ext_id

  def self.build_from(obj)
    return if obj.blank?
    pipe = Pipe.create_with({name: obj.name}).find_or_initialize_by(ext_id: obj.id)
    obj.phases.each do |phase|
      pipe.phases << Phase.build_from(phase)
    end
    pipe
  end

  def fields_title
    cards.map(&:fields_title).flatten.uniq
  end
end
