class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource
  respond_to :html

  before_action :reload_routes, :set_locale, :set_paper_trail_whodunnit

  @@routes_version = 0
  @@lock = Mutex.new

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    I18n.locale == I18n.default_locale ? { locale: nil } : { locale: I18n.locale }
  end

  def check_page_name_locale
    redirect_to root_path if current_page.try { name.blank? }
  end

  def user_for_paper_trail
    current_user&.email || 'Public user'
  end

  # Not foget enable cache in development
  def self.update_routes
    @@lock.synchronize do
      version = Rails.cache.fetch(:routes_version) { @@routes_version }
      return if @@routes_version == version

      Rails.logger.warn "NEW ROUTES VERSION: #{version}"
      Rails.application.reload_routes!
      @@routes_version = version
    end
  end

  def reload_routes
    ApplicationController.update_routes
  end

  rescue_from CanCan::AccessDenied do |exception|
    path = current_user ? root_path : new_user_session_path
    session[:previous_url] = request.fullpath
    redirect_to path, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || super
  end

  def paper_trail_enabled_for_controller
    ApplicationController.descendants.include? Admin::BaseController
  end

  def set_pages
    @pages ||= Page.navigation.sorted
  end

  private

  def layout_by_resource
    if devise_controller? && resource_name == :user
      "admin"
    else
      "application"
    end
  end
end
