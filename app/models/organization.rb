class Organization < ApplicationRecord
  has_many :pipes, dependent: :destroy
  accepts_nested_attributes_for :pipes

  validates_presence_of :name
  validates_uniqueness_of :ext_id

  def self.create_from(obj, ext_id)
    return if obj.blank?
    organization = Organization.create_with({name: obj.name}).find_or_create_by(ext_id: ext_id)
    obj.pipes.each do |pipe|
      organization.pipes << Pipe.build_from(pipe)
    end
    organization.save
    organization
  end
end
