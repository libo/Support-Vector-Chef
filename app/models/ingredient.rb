class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  validates_presence_of   :name
  validates_uniqueness_of :name
  before_validation :downcase_name

  private
  def downcase_name
    self.name.downcase!
  end
end
