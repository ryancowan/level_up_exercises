require_relative 'file_handler'
require_relative 'dinosaur'

class AfricanFile < FileHandler
  def map_to_object(content)
    dinosaur = Dinosaur.new()

    dinosaur.continent = 'Africa'

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
        when 'weight'
          dinosaur.weight = value

          if value.to_i > (TON_AS_POUNDS * 2)
            dinosaur.weight_classification = "big"
          elsif value.to_i > 0
            dinosaur.weight_classification = "small"
          else
            dinosaur.weight_classification = nil
          end
        else
          dinosaur.send("#{field.downcase}=", value)
      end
    end

    dinosaur
  end
end