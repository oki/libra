class CreateDescriptionVersions < ActiveRecord::Migration
  require_dependency 'description'
  def self.up
    Description.create_versioned_table
  end

  def self.down
    Description.drop_versioned_table
  end
end
