class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    status = @client.last_response.status

    Result.new(response, status)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end

  def gist_params
    {
      description: I18n.t('gists.description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  Result = Struct.new(:response, :status) do
    def gist_url
      response.html_url
    end

    def success?
      status == 201
    end
  end
end
