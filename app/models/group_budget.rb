class GroupBudget < ApplicationRecord
  belongs_to :budget
  belongs_to :group
end
