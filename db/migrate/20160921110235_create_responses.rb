class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :content
      t.integer :responder_id
      t.integer :respondable_id
      t.string :respondable_type

      t.timestamps null: false
    end
  end
end
