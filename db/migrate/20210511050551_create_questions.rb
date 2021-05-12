class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string      :title,        null: false
      t.text        :outline,      null: false
      t.text        :content,      null: false
      t.integer     :category_id,  null: false
      t.references  :user,        foreign_key: true

      t.timestamps
    end
  end
end
