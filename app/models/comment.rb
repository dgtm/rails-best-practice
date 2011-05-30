class Comment < ActiveRecord::Base
  belongs_to :post
  scope :recent, lambda{|count = nil| order("created_at DESC").limit(count)}
  delegate :address, :to => :user

  def commenter_address
    "#{self.post.address.city},#{self.post.address.country}"
  end

  def is_minimum_length?
    self.text.length > 4
  end

end

