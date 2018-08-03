json.posts @posts.each do |post|
  json.id post.id
  json.created_at l(post.created_at, format: :default)
  json.title post.title
  json.content post.content
  json.name post.user.name
end

