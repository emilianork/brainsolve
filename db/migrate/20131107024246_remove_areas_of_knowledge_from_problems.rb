class RemoveAreasOfKnowledgeFromProblems < ActiveRecord::Migration
  def change
    remove_column :problems, :areas_of_knowledge
  end
end
