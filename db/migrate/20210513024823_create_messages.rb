class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer     :who_id,      null: false
      t.text        :sentence,    null: false
      t.references  :question,    foreign_key: true

      t.timestamps
    end
  end
end
