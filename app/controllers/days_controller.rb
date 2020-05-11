class DaysController < ApplicationController
  before_action :authenticate_customer!
  respond_to :html, :json

  def index
    params['week'] ||= Week.first.id
    params['day'] ||= Day.first.id
    @weeks = Week.all
    @days = Day::DAYNAMES.map.with_index(1) { |a, i| [a, i]}
    @current_day = Day.find_by(week_id: params['week'], number: params['day'])
  end

  def training_description
    @training = TrainingVideo.find(params[:training]['id'].to_i)

    respond_modal_with @training
  end
end
