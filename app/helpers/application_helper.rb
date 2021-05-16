module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def inclination(number_of_questions, array=[])
    return array.last if (11..14).include?(number_of_questions % 100)

    ostatok = number_of_questions % 10

    case ostatok
    when 1
      array.first
    when 2..4
      array[1]
    else
      array.last
    end    
  end
end
