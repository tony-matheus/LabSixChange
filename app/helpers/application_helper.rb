module ApplicationHelper
  def credentials(credential)
    Rails.application.credentials[Rails.env.to_sym][credential]
  end
end
