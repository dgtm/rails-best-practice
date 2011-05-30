class Post < ActiveRecord::Base
include ActiveModel::Validations

has_many :comments
belongs_to :user

accepts_nested_attributes_for :comments

validates :title, :presence => true
validates :text, :presence => true

def recent_commenters
    self.comments.recent(5).include(:user).collect{|comment| comment.user.login}.map{|commenter| "<li>#{commenter}</li>"}.join("")
end

end

