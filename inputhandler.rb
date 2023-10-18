class InputHandler
  def self.get_integer(message)
    print message
    gets.chomp.to_i
  end

  def self.get_string(message)
    print message
    gets.chomp
  end

  def self.get_boolean(message)
    print message
    gets.chomp.downcase == 'y'
  end
end
