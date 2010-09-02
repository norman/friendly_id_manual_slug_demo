class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :cached_slug
      t.timestamps
    end

    add_index :books, :cached_slug, :unique => true

  end

  def self.down
    drop_table :books
  end
end
