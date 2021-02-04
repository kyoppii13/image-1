class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :image_url, nil: false
      t.references :user, null: false, foreign_key: true
      t.boolean :delete_flag, nil: false, default: false
      t.boolean :adult_flag, nil: false, default: false

      t.timestamps
    end
  end
end
