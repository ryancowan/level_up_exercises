require_relative 'file_handler'
require_relative 'dinosaur'

class DinodexFile < FileHandler
  def map_to_object(content)
    dinosaur = Dinosaur.new()

    #map headers to content
    headers.zip(content).each do |field, value|
      case field.downcase
        when 'weight_in_lbs'
          dinosaur.weight = value

          if value.to_i > (TON_AS_POUNDS * 2)
            dinosaur.weight_classification = "big"
          elsif value.to_i > 0
            dinosaur.weight_classification = "small"
          else
            dinosaur.weight_classification = nil;
          end
        else
          dinosaur.send("#{field.downcase}=", value)
      end
    end

    dinosaur
  end
end