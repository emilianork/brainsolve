class AddAreasOfKnowledge < ActiveRecord::Migration
  def up
    actuaria = "Los actuarios son profesionistas que estudian, plantean, formulan y aplican" +
      " modelos de contenido matemático, con el fin de proveer información para la planeación," +
      " previsión y la toma de decisiones, para resolver problemas económicos y sociales que " +
      "involucran riesgos. Los egresados están capacitados para intervenir en ámbitos que van " +
      "desde el demográfico y financiero hasta el ecológico y administrativo para interactuar con " +
      "los profesionistas que ahí se desempeñen. Su campo de trabajo está en los sectores públicos" +
      " o de la administración pública descentralizada, así como en el sector privado en compañías" +
      " aseguradoras, despachos de consultoría actuarial y estadística, de cómputo e informática y " +
      "de finanzas."

    AreasOfKnowledge.create!(:name => "Actuaría", :description => actuaria)

    biologia = "El egresado de la licenciatura en Biología es concebido como una persona cuyo bagaje" +
      " intelectual incluya un espectro de conocimientos básicos desde el nivel molecular y celular," +
      " hasta visiones integrativas que le permitan comprender los procesos de cambio de la biosfera " +
      "en el tiempo y en el espacio. Debe ser una persona consciente no sólo de la extraordinaria" +
      " diversidad biológica que caracteriza al país, sino también de la riqueza que el uso y "+
      "preservación de ésta representan para mantener y desarrollar nuestra identidad nacional. El" +
      " egresado de Biología es un profesional que por sus conocimientos profundos de la ciencia" +
      " de la vida, realiza docencia e investigación y colabora adecuadamente aplicando sus" +
      " conocimientos para resolver problemas de investigación o aplicaciones de otras disciplinas" +
      " vinculadas."

    AreasOfKnowledge.create!(:name => "Biología",:description => biologia)

    ciencias_ambientales = "La Licenciatura en Ciencias Ambientales busca formar recursos humanos " +
      "en el estudio y solución de problemas ambientales, manejo de ecosistemas y manejo integral" +
      " del paisaje. Los egresados desarrollan una visión integral de los sistemas socio-ambientales " +
      "con un enfoque interdisciplinario, con bases sólidas en ciencias naturales y sociales, con " +
      "las aptitudes y actitudes necesarias para identificar, analizar y resolver problemas ambientales."

    AreasOfKnowledge.create!(:name =>  "Ciencias Ambientales", :description =>  ciencias_ambientales)

    ciencias_de_la_computacion = "El objetivo fundamental es formar profesionales que puedan partici" +
      "par en proyectos que involucren programación, y diseño y análisis de sistemas complejos para" +
      " la automatización de muy diversas actividades. Hay una gran demanda de profesionales de la " +
      "computación en todos los ámbitos sociales y empresariales, por lo que la preparación de profesi" +
      "onales que manejen los fundamentos de la disciplina y con la capacidad de seguir aprendiendo" +
      " resulta imprescindible para el País. Asimismo, dada la gran carencia que hay de académicos " +
      "dedicados a esta disciplina, es objetivo importante de esta licenciatura formar profesionistas " +
      "con el interés y capacidad para impartir cátedra en los niveles medio superior y superior. Los " +
      "estudiantes adquirirán las bases y fundamentos para que puedan tener un crecimiento personal y " +
      "profesional durante toda su vida, ya sea en este campo de conocimiento o en campos afines. Se desea" +
      " formar profesionales de la computación que tengan la habilidad de resolver problemas que impliquen" +
      " la automatización computacional; tanto usando software ya existente como diseñando aplicaciones " +
      "novedosas. Entre los profesionales que busca formar esta licenciatura se encuentran aquellos capaces" +
      " de apoyar en la investigación a otras disciplinas científicas o aquellas que hagan uso de almacena" +
      "miento y proceso masivo de información."

    AreasOfKnowledge.create!(:name =>  "Ciencias de la Computación", :description =>  ciencias_de_la_computacion)

    ciencias_de_la_tierra = "Para resolver los problemas relacionados con la Tierra, el ambiente " +
      "y la sociedad, se debe analizar conjuntamente el impacto que genera la actividad humana en" +
      " el planeta y su ambiente, y en una escala mayor, la perturbación que puede causar la diná" +
      "mica terrestre en la sociedad, con una visión integradora que sea capaz de articular los d" +
      "iferentes aspectos del sistema Tierra-Ambiente-Sociedad, y a su vez poseer un conocimiento" +
      " profundo del sistema Tierra-Agua-Atmósfera. También es necesario estudiar la interrelació" +
      "n entre la Tierra y el espacio exterior; la medida en que los fenómenos que ocurren en el " +
      "espacio afectan a los sistemas terrestres, y ver los procesos que ocurren en los cuerpos d" +
      "el Sistema Solar, los cuales proporcionan elementos que permiten vislumbrar aspectos del p" +
      "asado y el futuro del planeta.\nUn enfoque fundamental en el estudio del sistema Tierra, d" +
      "eberá hacer énfasis en las interacciones relevantes entre los procesos químicos, físicos, " +
      "biológicos y geológicos que abarcan escalas, desde micrométricas, hasta órbitas planetaria" +
      "s, y escalas de tiempo de milisegundos a millones de años."

    AreasOfKnowledge.create!(:name =>  "Ciencias de la Tierra", :description =>  ciencias_de_la_tierra)

    fisica = "Es el profesional de la Física que cuenta con los conocimientos y habilidades" +
      " matemáticas de alto nivel, así como dominio de una metodología teórico- experimental " +
      "que le permiten llegar a conclusiones validables. Modela teóricamente el comportamiento" +
      " de los múltiples sistemas físicos y prevé la existencia de otros, mediante la aplicación" +
      " de leyes y sus derivados. Reformula la teoría de cada sistema físico, a través de la " +
      "sujeción de sus consecuencias tanto a la prueba experimental como al juicio de los " +
      "demás miembros de la comunidad de científicos activos en el campo de que se trate."

    AreasOfKnowledge.create!(:name =>  "Física", :description =>  fisica)

    manejo_sustentable_de_zonas_costeras = "El plan de estudios de esta licenciatura responde " +
      "a la necesidad de la nación de formar personal calificado en aspectos de manejo y " +
      "conservación de los recursos costeros. El egresado tendrá la capacidad de planear " +
      "la explotación de los recursos naturales con la premisa de que su aprovechamiento" +
      " pueda sostenerse en el tiempo, lo cual implica conocer las características y el " +
      "potencial de los sistemas naturales, considerando su capacidad regenerativa."

    AreasOfKnowledge.create!(:name =>  "Manejo Sustentable de Zonas Costeras", :description =>  manejo_sustentable_de_zonas_costeras)

    matematicas = "Un matemático es un profesionista con gran capacidad de encontrar " +
      "analogías y de modelar situaciones reales. Aprende las matemáticas y sus relaciones" +
      " con otras disciplinas tanto científicas como sociales, en las cuales motiva y " +
      "resuelve problemas. En su ejercicio profesional destacan la investigación, así como" +
      " la aplicación de la matemática a otras ciencias como: economía, medicina, sociología," +
      " ingeniería, física y biología. Los matemáticos participan en equipos " +
      "interdisciplinarios abocados a la resolución de problemas comunes y específicos," +
      " así como en actividades de docencia y difusión de la matemática en diferentes " +
      "niveles"
    AreasOfKnowledge.create!(:name =>  "Matemáticas", :description =>  matematicas)
  end
  
  def down
    default_areas_of_knowledge = ["Actuaría","Biología", "Ciencias Ambientales", "Ciencias de la Computación",
      "Ciencias de la Tierra","Física", "Manejo Sustentable de Zonas Costeras", "Matemáticas"]
    
      default_areas_of_knowledge.each do |area_of_knowledge|
        object = AreasOfKnowledge.find_by_name(area_of_knowledge)
        object.destroy if (!object.nil?)
      end
    
  end
end
