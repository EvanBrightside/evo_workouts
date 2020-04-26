class Admin::DaysController < Admin::BaseController
  authorize_resource param_method: :strong_params

  resource(Day,
           collection_scope: [:sorted],
           location: proc { params[:stay_in_place] ?
                           edit_polymorphic_path([:admin, resource]) :
                           polymorphic_path([:admin, resource.class]) })

  private

  alias_method :collection_orig, :collection
  def collection
    @collection ||= collection_orig
      .page(params[:page]).per(settings.per_page)
  end

  def strong_params
    params.require(:day).permit!
  end
end
