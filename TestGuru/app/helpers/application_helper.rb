module ApplicationHelper
  def year
    Date.current.year
  end

  def github_url(author, repo)
    link_to('TestGuru', "https://github.com/#{author}/#{repo}")
  end
end
