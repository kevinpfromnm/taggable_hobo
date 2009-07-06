class TaggingsController < ActionController::Base
  hobo_model_controller

  auto_actions :write_only

  def create
    params[:tagging][:tag] = { :name => params[:tagging][:tag] }
    hobo_create
  end
end
