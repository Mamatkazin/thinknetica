class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.string :body
      t.belongs_to :question, unique: false, foreign_key: true

      t.timestamps
    end

    add_index :answers, :title
  end
end
