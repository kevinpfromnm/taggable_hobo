##module CompleteTagName
  #def self.included(base)
    #base.extend(ClassMethods)
  #end
#
  #class Config
    #attr_reader :model
    #attr_reader :model_id
#
    #def initialize(model_id)
      #@model_id = model_id
      #@model = model_id.to_s.camelize.constantize
    #end
#
    #def model_name
      #@model_id.to_s
    #end
  #end
#
  #module ClassMethods
    #def complete_tag_name(model_id = nil)
      #model_id = self.to_s.split('::').last.sub(/Controller$/, '').\
         #pluralize.singularize.underscore unless model_id
#
      #@complete_tag_name_config = CompleteTagName::Config.new(model_id)
      #include CompleteTagName::InstanceMethods
    #end
#
    #def complete_tag_name_config
      #@complete_tag_name_config || self.superclass.instance_variable_get('@complete_tag_name_config')
    #end
  #end
#
  #module InstanceMethods
    #autocomplete :new_tag_name do
      #model_instance = self.class.complete_tag_name_config.model.find(params[:id])
      #items = Tag.find(:all,:conditions => ['name LIKE ?',"%#{params[:query]}%"]).select { |i| i.viewable_by?(current_user) }
      #items = items - model_instance.tags
      #render :text => "<ul>\n" +
        #items.map { |i| "<li>#{i.name}</li>\n" }.join +
        #"</ul>"
    #end
  #end
#end
module ApplicationHelper
  include TagsHelper
end
