class Instrument < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  mount_uploader :image, ImageUploader
  serialize :image, JSON #eğer SQLite kullanıyorsan
  belongs_to :user, optional: true
  has_many :line_items

  validates :title, :price, :brand, :model, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud!"}
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum aloud!"}
  validates :price, length: {maximum: 7}

  '''Static'''
  BRAND = %w{ Fender Gibson E }
  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam}
  CONDITION = %w{ New Excellent Mint Used Fair Poor }

  private

  def not_referenced_by_any_line_item #TODO ???????????????????????
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end

end
