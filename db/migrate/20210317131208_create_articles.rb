class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :type
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
