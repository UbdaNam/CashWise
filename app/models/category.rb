class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_expenses, dependent: :destroy
  has_many :expenses, through: :category_expenses, dependent: :destroy

  validates :name, :icon, presence: true

  def ordered_by_recent
    expenses.order(created_at: :desc)
  end
end
