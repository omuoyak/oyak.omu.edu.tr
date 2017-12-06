class ApplicationController < ActionController::Base
  helper_method :settings
  protect_from_forgery with: :exception

  def settings
    Rails.cache.fetch("settings"){ site_settings }
  end

  def site_settings
    sets = Setting.all
    setting_hash = {}
    sets.each {|i| setting_hash[i.var] = i.value }
    setting_hash
  end
end
