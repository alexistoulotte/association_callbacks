ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../../test.sqlite3", :timeout => 5000)

ActiveRecord::Base.connection.create_table(:comments, :force => true)
ActiveRecord::Base.connection.create_table(:posts, :force => true)