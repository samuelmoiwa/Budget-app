class Budget < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_budgets, dependent: :destroy
  has_many :groups, through: :group_budgets
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
