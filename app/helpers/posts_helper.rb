module PostsHelper
  def popular(posts)
    [
      content_tag(:div) do
        posts.each do |post|
          <h4> link_to "#{post.title} (#{post.comments.length})", user_post_path(current_user,post) </h4>
          "#{post.text}"
        end
      end
      ].join("").html_safe
    end

    def all(posts)
      [
        content_tag(:div) do
          posts.each do |post|
            <h4> link_to "#{post.title} (#{post.comments.length})", user_post_path(current_user,post) </h4>
            "#{post.text}"
          end
        end
        ].join("").html_safe
      end
end
