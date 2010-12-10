class AddRequiredToTags < ActiveRecord::Migration
  def self.up
    add_column  "tags", "required", :boolean, :default => false
  end

  def self.down
    remove_column "tags", "required"
  end
end
