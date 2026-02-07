Jekyll::Hooks.register :posts, :pre_render do |post|
  # Get the creation date (first commit of the file)
  creation_time = `git log --follow --format=%ad --date=iso -- "#{post.path}" | tail -1`.strip
  post.data['date'] = creation_time unless creation_time.empty?

  # Get the last modified date (last commit of the file)
  modification_time = `git log -1 --format=%ad --date=iso -- "#{post.path}"`.strip
  post.data['last_modified_at'] = modification_time unless modification_time.empty?
end