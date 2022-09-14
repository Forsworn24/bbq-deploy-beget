module UsersHelper
  def user_avatar(user)
    if user.avatar.attached?
      image_tag user.avatar.variant(resize_to_fill: [200, 200]), class: "img-fluid mb-3 rounded-circle"
    else
      image_tag asset_path("user.png")
    end
  end
end