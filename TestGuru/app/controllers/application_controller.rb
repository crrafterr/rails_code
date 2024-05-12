class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(user)
    return admin_tests_path if user.is_a?(Admin)

    tests_path
  end
end
