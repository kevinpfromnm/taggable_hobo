class TagsController < ActionController::Base
  hobo_model_controller

  auto_actions :show, :create
  def index
    @tags = Tag.tag_counts
    this = @tags
  end
end
