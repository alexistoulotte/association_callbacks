require 'spec_helper'

describe AssociationCallbacks::ActiveRecord do

  context 'with has_many relation' do

    it 'invokes callback defines as method' do
      post = Post.create!
      expect {
        Comment.create!(post_id: post.id)
      }.to change { post.reload.comments_count }.by(1)
    end

    it 'invokes callback defines as method (with one argument)' do
      post = Post.create!
      expect {
        Comment.create!(post: post, created_at: 2.years.ago)
      }.to change { post.reload.last_comment_at }.from(nil)
      post.last_comment_at.to_i.should be_within(5).of(2.years.ago.to_i)
    end

    it 'invokes callback defines as block' do
      post = Post.create!
      comment = Comment.create!(post: post)
      expect {
        comment.destroy
      }.to change { post.reload.comments_count }.by(-1)
    end

    it 'invokes regular callbacks' do
      post = Post.new(body: 'this is body', title: 'foo')
      expect {
        post.save!
      }.to change { post.texts }.from(nil).to('foo,this,is,body')
    end

  end

  context 'with belongs_to relation' do

    it 'invokes callback defines as method' do
      post = Post.create!
      comment = post.comments.create!
      expect {
        post.update_attributes!(title: 'foo')
      }.to change { comment.reload.post_updated_at }
      comment.post_updated_at.to_i.should be_within(5).of(Time.now.to_i)
    end

    it 'invokes callback defines as method (with one argument)' do
      post = Post.create!(title: 'foo')
      comment = post.comments.create!
      expect {
        post.update_attributes!(title: 'bar')
      }.to change { comment.reload.post.title }.from('foo').to('bar')
    end

    it 'invokes callback defines as block' do
      post = Post.create!
      comment = Comment.create!(post_id: post.id)
      expect {
        post.destroy
      }.to change { comment.reload.orphan_from_id }.from(nil).to(post.id)
    end

    it 'invokes regular callbacks' do
      post = Post.create!(title: 'foo')
      comment = Comment.new(post: post)
      expect {
        comment.save!
      }.to change { comment.post_title }.from(nil).to('foo')
    end

  end

end
