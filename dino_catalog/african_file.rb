# Sample headers: Genus,Period,Carnivore,Weight,Walking
# Sample content: Melanorosaurus,Triassic,No,2400,Quadruped
require_relative 'file_handler'
require_relative 'dinosaur'

class AfricanFile < FileHandler
  def get_all_dinosaurs()
    dinosaurs = []

    #loop through content
    contents.each do |content|
      dinosaurs << map_to_dinosaur(content)
    end

    dinosaurs
  end

  def map_to_dinosaur(content)
    dinosaur = Dinosaur.new()

    #map headers to content
    headers.zip(content).each do |field, value|
      case field.downcase
        when 'genus'
          dinosaur.name = value
        when 'carnivore'
          if value == 'Yes'
            dinosaur.diet = 'Carnivore'
          else
            dinosaur.diet = 'Herbivore'
          end
        else
          dinosaur.send("#{field.downcase}=", value)
      end
    end

    dinosaur
  end
end