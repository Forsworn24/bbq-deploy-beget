module ApplicationHelper  
  def avatar(user)
    if user.avatar.attached?
      user.avatar
    else
      asset_path("user.png")
    end
  end
  
  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class} text-white bg-secondary p-1 rounded-2"
  end

  def provider_compact(provider)
    provider == :google_oauth2 ? 'Google' : provider
  end
end
