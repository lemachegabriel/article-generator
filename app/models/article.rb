class Article < ApplicationRecord
  has_many :business_idea
  before_create :create_param

  private

  def create_param
    self.param = title.parameterize
  end
end
