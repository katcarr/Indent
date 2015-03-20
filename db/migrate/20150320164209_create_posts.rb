class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :content, :string
      t.column :date, :date

      t.timestamps
    end
  end
end
