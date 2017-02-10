class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.string :body
      t.belongs_to :question, index: true, unique: false, foreign_key: true

      t.timestamps null: false
    end

    add_index :answers, :title
  end
end
