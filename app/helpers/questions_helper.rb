# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    test = question.test.title
    question.persisted? ? "Edit #{test} Question" : "Create New #{test} Question"
  end

  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    link_to "GitHub #{author}", "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow',
                                                                        rel: 'noopener'
  end
end
