class Document < ApplicationRecord
  belongs_to :todo

  mount_base64_uploader :document, DocumentUploader
end
