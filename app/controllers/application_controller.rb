class ApplicationController < ActionController::Base
  # include Pundit
  helper_method :settings
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def settings
    Rails.cache.fetch("settings"){ site_settings }
  end

  def site_settings
    sets = Setting.all
    setting_hash = {}
    sets.each {|i| setting_hash[i.var] = i.value }
    setting_hash
  end

  private
  def user_not_authorized
    flash[:alert] = "Bu işlemi yapmaya yetkili değilsiniz!"
    redirect_to(request.referrer || admin_root_path)
  end

end
