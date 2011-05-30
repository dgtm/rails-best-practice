class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.references :user
      t.timestamps
    end

    add_column :counter_cache => :comments_counter, :integer, :default => 0
  end

  def self.down
    drop_table :posts
    remove_column :counter_cache => :comments_counter
  end
end

