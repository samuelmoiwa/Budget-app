class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_budgets, dependent: :destroy
  has_many :budgets, through: :group_budgets
end
