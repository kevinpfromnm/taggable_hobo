class Tag < ActiveRecord::Base
  hobo_model

  fields do
    name :string
  end
  
  has_many :taggings, :accessible => true

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

  # others
  def self.tag_counts
    Tag.find :all, :include => :taggings
  end

  def count
    taggings.count
  end
end
