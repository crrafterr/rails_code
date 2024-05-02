module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to('TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank', rel: %w[nofollow noopener])
  end

  def flash_message(type, msg)
    content_tag :p, msg, class: "flash #{type}"
  end
end
