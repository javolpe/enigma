class Enigma 
attr_reader :starter_message


def initialize(arg1)
   @starter_message = get_starter_message(arg1)
end

  def get_starter_message(arg)
    new_file = File.read(arg)
  end

end