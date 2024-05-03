module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to('TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank', rel: %w[nofollow noopener])
  end

  def flash_message(type)
    content_tag :p, type.last, class: "flash #{type.first}"
  end
end
