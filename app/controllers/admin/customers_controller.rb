class Admin::CustomersController < Admin::BaseController
  authorize_resource param_method: :strong_params

  before_action :remove_password_if_blank, only: [:update]

  resource Customer,
                location: proc { params[:stay_in_place] ?
                                edit_polymorphic_path([:admin, resource]) :
                                polymorphic_path([:admin, resource.class]) }


  private

  def remove_password_if_blank
    return unless strong_params[:password].blank?
    params.require(:customer).delete(:password)
  end

  def strong_params
    params.require(:customer).permit(:email, :password)
  end

  alias_method :collection_orig, :collection
  def collection
    @collection ||= collection_orig.search_for(params[:query])
      .page(params[:page]).per(settings.per_page)
      .order("#{params[:order_by]} #{params[:direction]}")
  end
end
