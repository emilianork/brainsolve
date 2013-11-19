# -*- coding: utf-8 -*-
class CreateAreasOfKnowledges < ActiveRecord::Migration
  def change
    create_table :areas_of_knowledges do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
