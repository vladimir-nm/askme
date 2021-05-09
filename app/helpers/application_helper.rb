module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def inclination(number_of_questions)
    questions = %w[вопрос вопроса вопросов]

    return questions.last if (11..14).include?(number_of_questions % 100)

    ostatok = number_of_questions % 10

    case ostatok
    when 1
      questions.first
    when 2..4
      questions[1]
    else
      questions.last
    end
  end
end
