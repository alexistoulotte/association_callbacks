class Comment < ActiveRecord::Base

  belongs_to :post, :inverse_of => :comments

  after_save :update_post_updated_at, :source => :post
  before_create :set_post_title
  before_save :update_post_title, :source => :post
  after_destroy :source => :post do |comment, post|
    comment.update_attributes!(:orphan_from_id => post.id)
  end

  private

  def set_post_title
    self.post_title = post.title
  end

  def update_post_title(post)
    update_attributes!(:post_title => post.title) if post.title_changed?
  end

  def update_post_updated_at
    update_attributes!(:post_updated_at => post.updated_at)
  end

end