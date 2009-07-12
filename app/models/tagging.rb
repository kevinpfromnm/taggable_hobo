class Tagging < ActiveRecord::Base
  hobo_model

  fields do
    created_at :timestamp
  end
  
  belongs_to :tag, :accessible => true
  belongs_to :taggable, :polymorphic => true

  validates_presence_of :tag
  validates_uniqueness_of :tag_id, 
    :scope => [:taggable_type, :taggable_id], 
    :message => 'already in place.'

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
