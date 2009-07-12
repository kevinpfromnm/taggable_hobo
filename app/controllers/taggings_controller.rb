class TaggingsController < ActionController::Base
  hobo_model_controller

  auto_actions :write_only

  def create
    tag_name = params[:tagging][:tag]
    params[:tagging][:tag] = nil
    tagging = Tagging.new params[:tagging]
    tagging.tag = Tag.find_by_name(tag_name) || Tag.new(:name => tag_name)
    tagging.save
    self.this ||= tagging
    create_response :new
  end
end
