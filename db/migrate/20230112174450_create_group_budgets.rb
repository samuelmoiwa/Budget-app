class CreateGroupBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :group_budgets do |t|
      t.references :budget, null: false, foreign_key: { to_table: :budgets }, index: true
      t.references :group, null: false, foreign_key: { to_table: :groups }, index: true
      t.timestamps
    end
  end
end
