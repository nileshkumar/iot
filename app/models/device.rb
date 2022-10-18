class Device < ApplicationRecord

  belongs_to :site

  validates :variant_name, presence: true
  validates :manufacturer, presence: true

end
