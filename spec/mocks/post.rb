class Post < ActiveRecord::Base

  has_many :comments, :inverse_of => :post

  after_create :increment_comments_count, :update_last_comment_at, :source => :comments
  after_destroy :source => :comments do |post|
    post.decrement!(:comments_count)
  end
  before_save do |post|
    post.texts = "#{post.title} #{post.body}".strip.split(/\s+/).join(',')
  end

  private

  def increment_comments_count
    increment!(:comments_count)
  end

  def update_last_comment_at(comment)
    update_attributes!(:last_comment_at => comment.created_at)
  end

end