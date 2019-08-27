class RegistrationsController < Devise::RegistrationsController
layout "no_nav"
  protected

  def after_sign_up_path_for(resource)
    '/pricing'
  end
end
