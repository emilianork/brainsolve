class AddAcronymsToAreasOfKnowledge < ActiveRecord::Migration
  def change
    AreasOfKnowledge.find_by_name("Actuaría").update_attributes(:acronym => "Actuaría")
    AreasOfKnowledge.find_by_name("Biología").update_attributes(:acronym => "Biología")
    AreasOfKnowledge.find_by_name("Ciencias Ambientales").update_attributes(:acronym => "C. Ambientales")
    AreasOfKnowledge.find_by_name("Ciencias de la Computación").update_attributes(:acronym => "Computación")
    AreasOfKnowledge.find_by_name("Ciencias de la Tierra").update_attributes(:acronym => "C. Tierra")
    AreasOfKnowledge.find_by_name("Física").update_attributes(:acronym => "Física")
    AreasOfKnowledge.find_by_name("Manejo Sustentable de Zonas Costeras").update_attributes(:acronym => "Zonas Costeras")
    AreasOfKnowledge.find_by_name("Matemáticas").update_attributes(:acronym => "Matemáticas")

  end
end
