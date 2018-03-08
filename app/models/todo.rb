class Todo < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :documents

  attr_accessor :document_data

  validates_presence_of :title, :created_by

#  mount_base64_uploader :picture, PictureUploader
end
