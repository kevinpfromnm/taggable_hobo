class Tagging < ActiveRecord::Base
  hobo_model

  fields do
    created_at :timestamp
  end
  
  belongs_to :tag, :accessible => true
  belongs_to :taggable, :polymorphic => true

  validates_presence_of :tag
  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
    true
  end

  def update_permitted?
    acting_user.administrator?
    true
  end

  def destroy_permitted?
    acting_user.administrator?
    true
  end

  def view_permitted?(field)
    true
  end

end
