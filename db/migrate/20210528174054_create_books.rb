class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :image_url
      t.string :author
      t.string :slug

      t.timestamps
    end
  end
end
