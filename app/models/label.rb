class Label < ApplicationRecord
  validates_uniqueness_of :ext_id
  validates_presence_of :ext_id, :name
end
