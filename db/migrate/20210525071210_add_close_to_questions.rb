class AddCloseToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :close, :boolean, default: false, null: false
  end
end
