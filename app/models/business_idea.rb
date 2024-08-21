class BusinessIdea < ApplicationRecord
  belongs_to :article
has_many :section
end
