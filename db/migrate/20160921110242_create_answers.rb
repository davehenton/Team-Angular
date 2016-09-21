class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :question_id
      t.integer :answerer_id

      t.timestamps null: false
    end
  end
end
