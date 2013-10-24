ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: File.expand_path("#{__dir__}/../../test.sqlite3"), timeout: 5000)

ActiveRecord::Base.connection.create_table(:comments, force: true) do |t|
  t.integer :orphan_from_id
  t.datetime :post_updated_at
  t.integer :post_id
  t.string :post_title
  t.timestamps
end
ActiveRecord::Base.connection.create_table(:posts, force: true) do |t|
  t.text :body
  t.integer :comments_count, default: 0
  t.datetime :last_comment_at
  t.text :texts
  t.string :title
  t.timestamps
end
