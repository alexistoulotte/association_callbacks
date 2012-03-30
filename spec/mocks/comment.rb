class Comment < ActiveRecord::Base
  
  belongs_to :post, :inverse_of => :comments
  
end