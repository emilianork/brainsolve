class AddDetailsToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :areas_of_knowledge_id, :integer
  end
end
